class WelcomesController < ApplicationController
  skip_before_action :require_login

  def home
    if logged_in?
      redirect_to user_path(current_user.id)
    else
      render :home
    end
  end
end
