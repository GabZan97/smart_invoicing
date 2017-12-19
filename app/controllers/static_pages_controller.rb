class StaticPagesController < ApplicationController
  before_action :require_login, only: :statistics
  def home
  end

  def help
  end

  def about
  end

  def statistics
    @hours = Hour.where(user_id: current_user.id).to_a
    @clients = Client.where(user_id: current_user.id).to_a
    invoices_hid = @hours.uniq.pluck(:invoice_id)
    @invoices = Invoice.where(id: invoices_hid)
  end
end
