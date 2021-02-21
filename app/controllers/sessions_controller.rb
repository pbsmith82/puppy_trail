class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :omniauth, :create]
    
    
    def omniauth
        user = User.create_from_omniauth(auth)

        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            flash[:message] = "Sorry Incorrect Email or Password."
            redirect_to login_path
        end
    end
    


    def new
        if logged_in? 
            redirect_to user_path(current_user)
        else
            @user=User.new
        end
    end




    def create
        user = User.find_by(email: params[:user][:email])
        
            if user && !!user.authenticate(params[:user][:password]) 
                session[:user_id] = user.id
                redirect_to user_path(user.id)
            else
                flash[:message] = "Sorry Incorrect Email or Password."
                redirect_to login_path
            end

    end




    def destroy
        session.clear
        redirect_to login_path
    end



    private
    

  end