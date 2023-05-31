class AddInterviewForeignKeyToContacts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contacts, :interview, null: true, foreign_key: true, optional: true
  end
end
