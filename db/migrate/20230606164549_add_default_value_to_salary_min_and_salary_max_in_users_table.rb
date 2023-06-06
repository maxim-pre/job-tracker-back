class AddDefaultValueToSalaryMinAndSalaryMaxInUsersTable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :salary_min, default: 0
    change_column_default :users, :salary_max, default: 0
  end
end
