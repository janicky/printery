class AddLastActivityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_activity, :datetime
  end
end
