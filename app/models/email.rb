require 'csv'
class Email < ApplicationRecord
  belongs_to :email_batch, optional: true
  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      new_hash = {}
      row.to_hash.each do |k,v|
        new_hash.merge!({k.downcase => v.downcase})
      end
      # creates a user for each row in the csv file
      Email.create!(new_hash)
    end
  end
end
