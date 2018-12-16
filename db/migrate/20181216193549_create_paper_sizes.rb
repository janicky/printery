class CreatePaperSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :paper_sizes do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.decimal :multiplier

      t.timestamps
    end
  end
end
