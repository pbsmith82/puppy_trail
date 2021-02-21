class Dog < ApplicationRecord
    has_many :walks
    has_many :users, through: :walks
    belongs_to :owner, class_name: "User"

    validates :name, :breed, :walks_needed, presence: true

    scope :ordered_by_breed, -> {order(breed: :asc)}
    
    
    def self.walk_needed
      @dogs =[]
        Dog.all.each do |dog|
            walked_today = dog.walks.where(created_at:(Time.now.utc - 1.day)..Time.now.utc)
            if dog.walks_needed > walked_today.count
                @dogs << dog
            end
        end
      @dogs
    end

    def self.dog_list
        @dogs = []

        Dog.all.each do |dog|
            @dog_info = [dog.name, dog.id]
            @dogs << @dog_info
        end
        @dogs
    end


end
