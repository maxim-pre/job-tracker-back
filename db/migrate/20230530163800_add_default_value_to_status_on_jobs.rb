class AddDefaultValueToStatusOnJobs < ActiveRecord::Migration[7.0]
  def change
    change_column_default :jobs, :status, 'bookmarked'
  end
end
