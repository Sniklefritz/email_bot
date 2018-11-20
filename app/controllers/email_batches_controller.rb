class EmailBatchesController < ApplicationController
  def new
  end

  def create
    render plain: params[:email_batch].inspect
  end
end
