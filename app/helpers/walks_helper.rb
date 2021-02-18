module WalksHelper

    def walks_header(dog)
        if dog
         "#{dog.name}'s"
        else
         "All"
        end
    end

end
