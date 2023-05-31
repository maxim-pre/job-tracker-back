class Interview < ApplicationRecord
    has_many :contacts
    validates :date, presence: true
end
