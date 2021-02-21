module DogsHelper

    def owners_name
        @user = User.find_by(id: owner_id)
        @name = @user.first_name + " " + @user.last_name
        @name
    end

    def needs_walked_active_nav
        # byebug
        if params[:action] == "needs_walked"
            "nav-link active"
        else
            "nav-link time"
        end
    end

    def breeds_active_nav
        # byebug
        if params[:action] == "by_breeds"
            "nav-link active"
        else
            "nav-link time"
        end
    end

    def all_dogs_active_nav
        # byebug
        if params[:action] != "by_breeds" && params[:action] != "needs_walked"
            "nav-link active"
        else
            "nav-link"
        end
    end
    



end
