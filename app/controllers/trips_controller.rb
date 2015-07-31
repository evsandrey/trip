class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    if params[:images]
        #===== The magic is here ;)
        params[:images].each { |image|
          @trip.pictures.create(image: image, user_id: current_user.id)
        }
      end
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_user
     @trip = Trip.find(params[:trip_id])
     @user = User.find(params[:trip_user_id])
     if !@trip.users.include?(@user) and @user.id != @trip.captain
      @trip.users << @user 
         if @trip.save
            respond_to do |format|
              format.js { render partial: "shared/smallbadge", locals: { user: @user } }
            end
          end
      else
        respond_to do |format|
          format.js { render "error", :text => "exist" }
        end
      end
  end

  def select_place
     @trip = Trip.find(params[:trip_id])
     @place = Place.find(params[:trip_place_id])
     if @trip.place!=@place
      @trip.place = @place 
         if @trip.save
            respond_to do |format|
              format.js { render partial: "shared/smallplace", locals: { place: @place.id } }
            end
          end
      else
        respond_to do |format|
          format.js { render "error", :text => "exist" }
        end
      end
  end

  def create_trophy
     #trip_id: tripid, user_id: userid, fish_id: trophy_fish, fish_weight: trophy_weight, bait_id: trophy_bait
     @trophy = Trophy.new()
     @trophy.trip_id = params[:trip_id]
     @trophy.user_id = params[:user_id]
     @trophy.fish_id = params[:fish_id]
     @trophy.weight = params[:fish_weight]
     @trophy.bait_id = params[:bait_id]
     @trip = Trip.find(params[:trip_id])
     if !@trip.place.nil? 
      @trophy.lat = @trip.place.lat
      @trophy.lng = @trip.place.lng
     else
      @trophy.lat = 55.7500
      @trophy.lng = 37.6167
    end

     if @trophy.save
            respond_to do |format|
              format.js { render partial: "shared/smalltrophy", locals: { trophy: @trophy } }
            end
     else
        respond_to do |format|
          format.js { render "error", :text => "exist" }
        end
     end
     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :description, :captain, :cover, :user_id,:sdesc,:sdate,:edate, {:user_ids => []})
    end
end
