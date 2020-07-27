class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :year_created
      t.string :description
      t.string :picture
      t.string :type
      t.integer :collection_id
      t.integer :exhibit_id

      t.timestamps
    end
  end
end
