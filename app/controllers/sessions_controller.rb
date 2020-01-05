class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/assets'
      flash[:success] = "Welcome, #{user.username}!"
    else
      flash[:danger] = 'Invalid username or password'
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/assets'
    flash[:success] = 'Goodbye!'
  end
end
