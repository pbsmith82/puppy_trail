# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DATA = {
    :user_keys =>
        ["first_name", "last_name", "email", "age", "years_experience", "password"],
    :users => [
        ["Beverly", "Smith", "bksmith@gmail.com", 30, 10, "password"],
        ["Phillip", "Smith", "pdsmith@gmail.com", 30, 10, "password"],
        ["Brandon", "Smith", "pbsmith@gmail.com", 30, 10, "password"],
        ["Robyn", "Smith", "rrsmith@gmail.com", 30, 10, "password"],
        ["Curtis", "Smith", "casmith@gmail.com", 30, 10, "password"]
    ],
    :dog_keys =>
        ["name", "breed", "walks_needed","owner_id"],
    :dogs => [
        ["Liam", "Frenchie", 2, 1],
        ["Pierre", "Frenchie", 2, 1],
        ["Eli", "Frenchie", 3, 1],
        ["Daisy", "Frenchie", 1, 1],
        ["Spot", "Frenchie", 2, 2],
        ["Kirby", "Frenchie", 3, 2],
        ["Max", "Frenchie", 1, 3],
        ["Paris", "Frenchie", 2, 4],
        ["Lady", "Frenchie", 3, 4],
        ["Jax", "Frenchie", 2, 4],
        ["Rover", "Frenchie", 1, 4],
        ["Gabby", "Frenchie", 2, 5],
        ["Trixie", "Frenchie", 2, 5]
    ]
}

def main
    make_users
    make_dogs
    # make_walks
end

def make_users
    DATA[:users].each do |user|
      new_user = User.new
      user.each_with_index do |attribute, i|
        new_user.send(DATA[:user_keys][i]+"=", attribute)
      end
      new_user.save
    end
end

def make_dogs
    DATA[:dogs].each do |dog|
      new_dog = Dog.new
      dog.each_with_index do |attribute, i|
        new_dog.send(DATA[:dog_keys][i]+"=", attribute)
      end
      new_dog.save
      new_walk = new_dog.walks.create(distance: 1, watered: 1, fed: 1, user_id: 2)
      new_walk.save
    end
end

# def make_walks
#     Dog.all.each do |dog|
#      walk = dog.walks.build(distance: 1, fed: true, watered: true, user_id: dog.id)
#      walk.save
#     end
# end

main