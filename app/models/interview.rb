class Interview < ApplicationRecord
    belongs_to :job
    has_many :contacts
    validates :date, presence: true
end
