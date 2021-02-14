class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end



  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :age, :years_experience, :password, :email)

end
