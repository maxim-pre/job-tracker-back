class AddFollowUpDateColumnToJobsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :follow_up_date, :date
  end
end
