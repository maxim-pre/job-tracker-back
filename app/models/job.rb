class Job < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :destroy
  has_many :notes, dependent: :destroy
  validates :title, :company, presence: true
  validates :title, :company, length: {maximum: 255}
end
