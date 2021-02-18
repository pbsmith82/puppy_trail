class Walk < ApplicationRecord
    belongs_to :user
    belongs_to :dog

    def walkers_name
        @user = User.find_by(id: user_id)
        @name = @user.first_name + " " + @user.last_name
        @name
      end
      
      def walker
        @user = User.find_by(id: user_id)
      end

      def dogs_name
        @dog = Dog.find_by(id: dog_id)
        @dog.name
      end  

end
