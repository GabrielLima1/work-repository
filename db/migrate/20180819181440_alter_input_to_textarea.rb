class AlterInputToTextarea < ActiveRecord::Migration[5.1]
  def up
    change_column :works, :name, :text
  end
  def down
    change_column :works, :name, :text
  end
end
