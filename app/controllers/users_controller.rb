class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_update_params)
    redirect_to user_path(@user)
  end

  def show 
    @user = User.find_by(id: params[:id])
  end


  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :age, :years_experience, :password, :email)
  end

  def user_update_params
    params.required(:user).permit(:first_name, :last_name, :age, :years_experience, :email)
  end

end
