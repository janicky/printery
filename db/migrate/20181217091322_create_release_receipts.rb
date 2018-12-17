class CreateReleaseReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :release_receipts do |t|
      t.references :order, foreign_key: true
      t.datetime :release_date
      t.references :user, foreign_key: true
      t.decimal :price
    end
  end
end
