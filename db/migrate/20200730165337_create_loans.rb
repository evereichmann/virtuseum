class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.integer :item_id
      t.integer :exhibit_id

      t.timestamps
    end
  end
end
