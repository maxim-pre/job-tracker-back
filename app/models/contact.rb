class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :interview, optional: true
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: {minimum: 3, maximum: 55}

end
