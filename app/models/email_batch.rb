class EmailBatch < ApplicationRecord
  has_many :emails
  validates :title, presence: true, length: { minimum: 5}
end
