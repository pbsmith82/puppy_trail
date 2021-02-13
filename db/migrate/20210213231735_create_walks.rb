class CreateWalks < ActiveRecord::Migration[6.1]
  def change
    create_table :walks do |t|
      t.integer :distance
      t.boolean :fed
      t.integer :watered
      t.integer :user_id
      t.integer :dog_id

      t.timestamps
    end
  end
end
