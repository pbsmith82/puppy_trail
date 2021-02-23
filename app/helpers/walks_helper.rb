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

    
    def walk_footer
        out = ''
        if @dog 
            out << '<a class="btn btn-secondary btn-sm" href="' + dog_walks_path(@dog) +'" role="button">Cancel</a>'
        elsif
            @walk.id != nil
            out << '<a class="btn btn-secondary btn-sm" href="' + dogs_path + '" role="button">Cancel</a> '
            out << '<a class="btn btn-danger btn-sm" href="delete" role="button">Delete</a>'
        else
            out << '<a class="btn btn-secondary btn-sm" href="' + dogs_path + '" role="button">Cancel</a>'
        end
        out.html_safe
    end
        

    def walk_form_header(f)
        out = ''
        if @dog
            out << '<div class="col" align="right"><br>Dog: </div>'
            out << '<div class="col-md-auto"><br>' + @dog.name + '</div>'
        else
            out << '<div class="col" align="right"><br>' + (f.label  'Dog:') + '</div>'
            out << '<div class="col-md-auto"><br>' + (f.select :dog_id, @dogs) + '</div>'
        end
        #byebug
        out.html_safe
    end


end
