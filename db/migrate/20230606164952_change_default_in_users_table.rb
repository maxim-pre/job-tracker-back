class ChangeDefaultInUsersTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :salary_max, :integer, default: 0
    change_column :users, :salary_min, :integer, default: 0
  end
end
