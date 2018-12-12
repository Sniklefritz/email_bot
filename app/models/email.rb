require 'pry'
require 'csv'
class Email < ApplicationRecord
  belongs_to :email_batch, optional: true
  # a class method import, with file passed through as an argument
  def self.import(file, email_batch_id)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      new_hash = {}
      row.to_hash.each do |k,v|
        if k == "Name" && !v
          v = "No Name"
        end

        new_hash.merge!({k.downcase => v.downcase})
      end
      # creates a user for each row in the csv file
      new_hash[:email_batch_id] = email_batch_id
      Email.create!(new_hash)
    end
  end
end
