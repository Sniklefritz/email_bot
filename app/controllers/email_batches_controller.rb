class EmailBatchesController < ApplicationController

  def show
    @email_batch = EmailBatch.find(params[:id])
  end

  def new
  end

  def create
    @email_batch = EmailBatch.new(email_batch_params)

    @email_batch.save
    redirect_to @email_batch
  end

  private
  def email_batch_params
    params.require(:email_batch).permit(:title, :text)
  end
end
