class RegistrationsController < ApplicationController

  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :password, :about))
    if @user.save
      session[:user_id] = @user_id
      redirect_to root_path
    else
      render :new
    end
  end


end
