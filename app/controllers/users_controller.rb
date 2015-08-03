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
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
      @user = User.find(params[:id])
  end  
  
end