class RemoveColumnFromItemTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :exhibit_id
  end
end
