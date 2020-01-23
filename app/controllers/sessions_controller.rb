class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/myassets'
      flash[:success] = "Welcome, #{user.username}!"
    else
      flash[:danger] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
    flash[:success] = 'Goodbye!'
  end
end
