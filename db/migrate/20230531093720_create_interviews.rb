class CreateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :interviews do |t|
      t.date :date
      t.string :format
      t.string :type

      t.timestamps
    end
  end
end
