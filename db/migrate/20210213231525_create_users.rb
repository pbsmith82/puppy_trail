class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_Name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.integer :years_experience

      t.timestamps
    end
  end
end
