class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.references :order, foreign_key: true
      t.references :machine, foreign_key: true
      t.integer :status
      t.integer :priority

      t.timestamps
    end
  end
end
