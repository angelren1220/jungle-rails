class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    
    if !user.valid?
      message = user.errors.full_messages.join(" ")
      redirect_to '/signup', notice: message
    else
      user.save
      session[:user_id] = user.id
      redirect_to '/' 
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
