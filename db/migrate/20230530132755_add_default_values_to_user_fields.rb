class AddDefaultValuesToUserFields < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :application_goal, 5
  end
end
