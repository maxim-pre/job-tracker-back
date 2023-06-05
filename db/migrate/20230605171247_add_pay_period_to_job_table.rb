class AddPayPeriodToJobTable < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :pay_period, :string, default: "yearly"
  end
end
