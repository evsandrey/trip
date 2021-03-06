class BaitsController < ApplicationController
  
  autocomplete :bait, :name, :full => true, :extra_data => [:id]
  load_and_authorize_resource
  skip_authorize_resource :only => :json
  before_action :set_bait, only: [:show, :edit, :update, :destroy]
  # GET /baits
  # GET /baits.json
  def index
    @baits = Bait.all
  end

  # GET /baits/1
  # GET /baits/1.json
  def show
  end

  # GET /baits/new
  def new
    @bait = Bait.new
  end

  # GET /baits/1/edit
  def edit
  end

  # POST /baits
  # POST /baits.json
  def create
    @bait = Bait.new(bait_params)

    respond_to do |format|
      if @bait.save
        format.html { redirect_to @bait, notice: 'Bait was successfully created.' }
        format.json { render :show, status: :created, location: @bait }
      else
        format.html { render :new }
        format.json { render json: @bait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baits/1
  # PATCH/PUT /baits/1.json
  def update
    respond_to do |format|
      if @bait.update(bait_params)
        format.html { redirect_to @bait, notice: 'Bait was successfully updated.' }
        format.json { render :show, status: :ok, location: @bait }
      else
        format.html { render :edit }
        format.json { render json: @bait.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baits/1
  # DELETE /baits/1.json
  def destroy
    @bait.destroy
    respond_to do |format|
      format.html { redirect_to baits_url, notice: 'Bait was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def json
    @baits = Bait.all
    render :json => @baits.as_json(methods: :photo_url)
  end  

  def photo_url
    photo.url(:med)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bait
      @bait = Bait.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bait_params
      params.require(:bait).permit(:name, :description, :photo, :manufacturer, :manufacturer_id, :weight, :size, :number, :depth, :btype, :isize)
    end
end
