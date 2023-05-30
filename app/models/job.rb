class Job < ApplicationRecord
  belongs_to :user
  validates :title, :company, presence: true
  validates :title, :company, length: {maximum: 255}
end
