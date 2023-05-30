class Job < ApplicationRecord
  belongs_to :user
  has_many :contacts
  validates :title, :company, presence :true
  validates :title, :company, length: {maximum: 255}
  validates :min_salary, :max_salary, numericality: {only_integer: true}
end
