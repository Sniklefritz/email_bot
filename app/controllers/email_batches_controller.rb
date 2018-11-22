class EmailBatchesController < ApplicationController
  def new
  end

  def create
    @email_batch = EmailBatch.new(params[:email_batch])

    @email_batch.save
    redirect_to @email_batch
  end
end
