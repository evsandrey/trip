class FishController < ApplicationController
  autocomplete :fish, :name, :full => true, :extra_data => [:id]
  load_and_authorize_resource
  skip_authorize_resource :only => :json
  before_action :set_fish, only: [:show, :edit, :update, :destroy]

  # GET /fish
  # GET /fish.json
  def index
    @fish = Fish.order(name: :asc).all
  end

  # GET /fish/1
  # GET /fish/1.json
  def show
  end

  # GET /fish/new
  def new
    @fish = Fish.new
  end

  # GET /fish/1/edit
  def edit
  end
  
  def json
    render :json => @fish.as_json(only: [:id, :name], methods: :photo_url), :status => 200
  end  

  def photo_url
    photo.url(:med)
  end
  
  # POST /fish
  # POST /fish.json
  def create
    @fish = Fish.new(fish_params)

    respond_to do |format|
      if @fish.save
        format.html { redirect_to @fish, notice: 'Fish was successfully created.' }
        format.json { render :show, status: :created, location: @fish }
      else
        format.html { render :new }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fish/1
  # PATCH/PUT /fish/1.json
  def update
    respond_to do |format|
      if @fish.update(fish_params)
        format.html { redirect_to @fish, notice: 'Fish was successfully updated.' }
        format.json { render :show, status: :ok, location: @fish }
      else
        format.html { render :edit }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish/1
  # DELETE /fish/1.json
  def destroy
    @fish.destroy
    respond_to do |format|
      format.html { redirect_to fish_index_url, notice: 'Fish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish
      @fish = Fish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fish_params
      params.require(:fish).permit(:name, :description, :photo)
    end
end
