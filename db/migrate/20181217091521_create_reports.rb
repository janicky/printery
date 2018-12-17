class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.datetime :from
      t.datetime :to
      t.decimal :income
      t.integer :orders

      t.timestamps
    end
  end
end
