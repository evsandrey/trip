class UsersController < ApplicationController
#before_filter :authenticate_user!
  
  autocomplete :user, :nickname, :full => true, :extra_data => [:id]

  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
end