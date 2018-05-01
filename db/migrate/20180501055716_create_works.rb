class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :name
      t.boolean :status
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
