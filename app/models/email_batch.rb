class EmailBatch < ApplicationRecord
  has_many :emails
  #validates :subject, presence: true, length: { minimum: 5}
end
