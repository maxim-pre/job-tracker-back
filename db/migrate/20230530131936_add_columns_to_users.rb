class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string 
    add_column :users, :application_goal, :integer
    add_column :users, :salary_min, :integer 
    add_column :users, :salary_max, :integer 
    add_column :users, :target_title, :string
  end
end
