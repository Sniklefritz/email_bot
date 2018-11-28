class AddCampaignNameToEmailBatches < ActiveRecord::Migration[5.2]
  def change
    add_column :email_batches, :campaign_name, :string
  end
end
