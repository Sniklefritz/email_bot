class Email < ApplicationRecord
  require 'csv'

  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the csv file
      Email.create! row.to_hash
    end
  end
end
