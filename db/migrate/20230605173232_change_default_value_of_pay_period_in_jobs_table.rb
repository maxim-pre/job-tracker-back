class ChangeDefaultValueOfPayPeriodInJobsTable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :jobs, :pay_period, 'Yr'
  end
end
