class ChangeColumnNameInItemTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :type, :classification
  end
end
