class EmailController < ApplicationController
  def index
    @emails = Email.all
  end

  def import
    Email.import(params[:file])
    # after the import, redirect and let us know the method worked!
    redirect_to root_url, notice: "Email Data imported!"
  end
end
