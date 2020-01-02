class UsersController < ApplicationController
  def create
    new_user = User.create(user_params)
    if new_user.save
      flash[:success] = "Welcome, #{new_user.username}!"
      session[:user_id] = new_user.id
      redirect_to '/assets'
    else
      flash[:danger] = new_user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.permit(:email, :username, :password, :password_confirmation)
  end
end
