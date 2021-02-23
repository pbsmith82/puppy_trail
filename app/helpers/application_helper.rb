module ApplicationHelper

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    
    def logged_in?
        !!current_user
    end



    def nav_bar
        menu = ''
        if !logged_in?
            menu << '<li class="nav-item"> <a class="nav-link active" aria-current="page" href="' + signup_path + '">Signup</a> </li>'
            menu << '<li class="nav-item"> <a class="nav-link" href="' + login_path + '">Login</a></li>'    
        else
            menu << '<li class="nav-item"> <a class="nav-link" href="' + user_path(current_user.id) + '">Profile</a> </li>'
            menu << '<li class="nav-item"> <a class="nav-link" href="' + dogs_path + '">Dogs</a> </li>'
            menu << '<li class="nav-item"> <a class="nav-link" href="' + walks_path + '">Walks</a> </li>'
            menu << '<li class="nav-item"> <a class="nav-link" href="' + logout_path + '">Logout</a> </li>'
        end
        menu.html_safe
    end


end
