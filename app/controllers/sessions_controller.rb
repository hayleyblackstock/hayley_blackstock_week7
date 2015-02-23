class SessionsController < ApplicationController

  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:user][:user_name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.new(user_name: params[:user][:user_name])
      @user.errors[:base]
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to signin_path
  end


end
