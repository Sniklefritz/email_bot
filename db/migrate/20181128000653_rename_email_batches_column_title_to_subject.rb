class RenameEmailBatchesColumnTitleToSubject < ActiveRecord::Migration[5.2]
  def change
    rename_column :email_batches, :title, :subject
  end
end
