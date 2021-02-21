class User < ApplicationRecord
    has_many :walks
    has_many :dogs, through: :walks
    has_many :owned_dogs, foreign_key: "owner_id", class_name: "Dog"

    has_secure_password

    validates :first_name, :last_name, :email, :age, :years_experience, presence: true
    validates :email, uniqueness: true
    validates :age, numericality: { greater_than: 17 }
    


    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.first_name = auth[:info][:name].split.first
            u.last_name = auth[:info][:name].split.last
            u.email = auth[:info][:email] || auth[:info][:nickname]
            u.password = SecureRandom.hex(16)
            u.age = "18"
            u.years_experience = "0"
        end
    end

end
