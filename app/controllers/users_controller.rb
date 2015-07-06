class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Stack Overflow. Please enter your email and password"
      redirect_to sessions_path
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  def edit
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
