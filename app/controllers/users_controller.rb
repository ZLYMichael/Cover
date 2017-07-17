class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save!
      session[:users_id] = user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:users).permit(:email, :password, :password_confirmation)
  end
end