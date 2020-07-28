class CreateMuseums < ActiveRecord::Migration[6.0]
  def change
    create_table :museums do |t|
      t.string :name
      t.string :field_of_study
      t.string :information

      t.timestamps
    end
  end
end
