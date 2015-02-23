class SessionsController < ApplicationController  

  def create
    @user = User.find_by_user_name(params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @sign_in_error = 'Invalid email/password'
      render :new
    end
  end


  def destroy
    session.destroy
    redirect_to signin_path
  end


end
