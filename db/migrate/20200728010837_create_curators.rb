class CreateCurators < ActiveRecord::Migration[6.0]
  def change
    create_table :curators do |t|
      t.integer :user_id
      t.integer :museum_id

      t.timestamps
    end
  end
end
