class User < ApplicationRecord
    has_many :walks
    has_many :dogs, through: :walks
    has_many :owned_dogs, foreign_key: "owner_id", class_name: "Dog"

    has_secure_password


    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.first_name = auth[:info][:name].split.first
            u.last_name = auth[:info][:name].split.last
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(16)
        end
    end

end
