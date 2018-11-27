class AddEmailBatchIdToEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :email_batch_id, :integer
  end
end
