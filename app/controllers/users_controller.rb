class UsersController < ApplicationController
#before_filter :authenticate_user!
  load_and_authorize_resource
  autocomplete :user, :nickname, :full => true, :extra_data => [:id]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
      @user = User.find(params[:id])
  end  
  def user_params
      params.require(:user).permit(:name,:surname, :nickname,:slogan, :email, :avatar,:role)
  end
  
end