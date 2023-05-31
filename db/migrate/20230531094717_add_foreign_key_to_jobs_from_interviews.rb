class AddForeignKeyToJobsFromInterviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :interviews, :job, null: true, foreign_key: true
  end
end
