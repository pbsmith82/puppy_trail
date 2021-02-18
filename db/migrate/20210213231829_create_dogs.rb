class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :walks_needed
      t.integer :owner_id

      t.timestamps
    end
  end
end
