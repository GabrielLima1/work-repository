class CreateSubWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_works do |t|
      t.string :name
      t.boolean :status
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end
