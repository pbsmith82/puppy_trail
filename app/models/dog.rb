class Dog < ApplicationRecord
    has_many :walks
    has_many :users, through: :walks
    belongs_to :owner, class_name: "User"
    

    def owners_name
      @user = User.find_by(id: owner_id)
      @name = @user.first_name + " " + @user.last_name
      @name
    end     
end
