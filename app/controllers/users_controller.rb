class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :omniauth]
  before_action :require_user_access, only: [:edit, :update, :show]
  
  
  def index
    redirect_to user_path(current_user)
  end
  
  def new
    if logged_in? 
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
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

  def omniauth
    user = User.create_from_omniauth(auth)
    if user.valid? && user.email.include?("@")
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    elsif user.valid?
      session[:user_id] = user.id
      flash[:message] = "Please Update Email Address, Age, and Experience!"
      redirect_to edit_user_path(user.id)
    else
      flash[:message] = user.errors.full_messages.join(", ")
      redirect_to login_path
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

  def auth
    request.env['omniauth.auth']
  end

  def require_user_access
    user = User.find_by(id: params[:id])
    unless current_user.id == user.id
      flash[:error] = "Sorry, Access Denied."
      redirect_to user_path(current_user) 
    end
  end

end
