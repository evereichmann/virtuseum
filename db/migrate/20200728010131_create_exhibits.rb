class CreateExhibits < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibits do |t|
      t.string :name
      t.string :picture
      t.string :category
      t.string :date
      t.integer :museum_id

      t.timestamps
    end
  end
end
