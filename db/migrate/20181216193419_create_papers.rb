class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :name
      t.integer :grammage
      t.decimal :price
    end
  end
end
