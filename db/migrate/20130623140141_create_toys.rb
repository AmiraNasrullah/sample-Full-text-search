class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name
      t.string :category
      t.string :brande
      t.datetime :inserted_at
      t.integer :child_age
      t.integer :price

      t.timestamps
    end
  end
end
