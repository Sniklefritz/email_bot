require 'pry'
class EmailBatchesController < ApplicationController
  def index
    @email_batch = EmailBatch.all
  end

  def import
    Email.import(params[:file])
    #redirect_to email_index_path, notice: "Email Data imported!"
  end

  def show
    @email_batch = EmailBatch.find(params[:id])
  end

  def new
    @email_batch = EmailBatch.new
  end

  def edit
    @email_batch = EmailBatch.find(params[:id])
  end

  def create
    @email_batch = EmailBatch.new(email_batch_params)

    if @email_batch.save
      # take new email batch and use the id when creating the Email
      email_batch_id = @email_batch.id
      Email.import(params[:email_batch][:file], email_batch_id)
      # records from the spreadsheet
      redirect_to @email_batch
    else
      render 'new'
    end
  end

  def update
    @email_batch = EmailBatch.find(params[:id])

    if @email_batch.update(email_batch_params)
      redirect_to @email_batch
    else
      render 'edit'
    end
  end

  def destroy
    @email_batch = EmailBatch.find(params[:id])
    @email_batch.destroy

    redirect_to email_batches_path
  end

  def deliver_emails
    @email_batch = EmailBatch.find(params[:email_batch_id])

    @email_batch.emails.each do |email|
      UserMailer.welcome_email(email, @email_batch.subject, @email_batch.text).deliver_now

      sleep rand(5)
    end

    redirect_to email_batch_path(@email_batch)
  end

  private

  def email_batch_params
    params.require(:email_batch).permit(:campaign_name, :subject, :text)
  end
end
