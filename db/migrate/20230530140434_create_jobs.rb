class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :url
      t.string :company
      t.string :location
      t.text :description
      t.date :date_applied
      t.string :status
      t.integer :min_salary
      t.integer :max_salary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
