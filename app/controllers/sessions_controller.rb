class SessionsController < ApplicationController
    
    
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
        @user=User.new
    end




    def create
        user = User.find_by(email: params[:user][:email])
        
            if user.valid? && !!user.authenticate(params[:user][:password]) 
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
    


    def auth
        request.env['omniauth.auth']
    end

  end