class EmailBatchesController < ApplicationController
  def index
    @email_batch = EmailBatch.all
  end

  def show
    @email_batch = EmailBatch.find(params[:id])
  end

  def new
    @email_batch = EmailBatch.new
  end

  def create
    @email_batch = EmailBatch.new(email_batch_params)

    if @email_batch.save
      redirect_to @email_batch
    else
      render 'new'
    end
  end

  private
  def email_batch_params
    params.require(:email_batch).permit(:title, :text)
  end
end
