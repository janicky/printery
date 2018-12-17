class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :company, foreign_key: true
      t.decimal :price
      t.integer :count
      t.date :deadline
      t.string :description
      t.references :paper_size, foreign_key: true
      t.references :paper, foreign_key: true
      t.references :color_palette, foreign_key: true

      t.timestamps
    end
  end
end
