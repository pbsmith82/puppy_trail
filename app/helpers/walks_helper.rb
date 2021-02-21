module WalksHelper

    def walks_header(dog)
        if dog
         "#{dog.name}'s"
        else
         "All"
        end
    end

    
    
    def walks_button(dog)
        if dog
         new_dog_walk_path(dog.id)
        else
         new_walk_path
        end
    end


end
