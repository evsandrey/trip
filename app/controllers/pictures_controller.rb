class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /pictures
  # GET /pictures.json
  def index
    @trip = Trip.find(params[:trip_id])
    @pictures = @trip.pictures.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    puts params[:fileupload]
    
    @picture = Picture.new
    @picture.user_id = params[:user_id]
    @picture.trip_id = params[:trip_id]
    @picture.photo = params[:files].first
    if @picture.save
      render(json: to_fileupload(@picture), content_type: request.format)
    else
      render [:json => { :result => 'error'}], :content_type => 'text/html'
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render "error", :text => "Deleted" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      
    end
  def to_fileupload(picture)
  {
    files: [
      {
        id:   picture.id.to_s,
        name: picture.photo_file_name.to_s,
        type: picture.photo_content_type.to_s,
        size: picture.photo_file_size.to_s,
        url:  @picture.photo.url(:med).to_s
      }
    ]
  }
end

end
