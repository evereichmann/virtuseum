class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name_first
      t.string :name_last
      t.string :location

      t.timestamps
    end
  end
end
