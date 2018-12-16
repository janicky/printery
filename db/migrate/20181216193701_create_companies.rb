class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :tax_number
      t.string :address

      t.timestamps
    end
  end
end
