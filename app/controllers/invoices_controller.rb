class InvoicesController < ApplicationController
  before_action :require_login
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @hours = Hour.where(user_id: current_user.id).to_a
    @clients = Client.where(user_id: current_user.id).to_a
    invoices_hid = @hours.uniq.pluck(:invoice_id)
    @invoices = Invoice.where(id: invoices_hid)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    respond_to do |format|
      format.html
    end
  end

  def default
  end

  def document
    @user = current_user
    @new_invoice = Invoice.find(params[:invoice])
    @hours_to_bill = Hour.where(invoice_id: @new_invoice.id).to_a
    @client = Client.find_by(id: @hours_to_bill.first.client_id)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@new_invoice.id}_#{@client.name}_#{@user.name}",
                    :template => 'invoices/document.html.erb',  # Excluding ".pdf" extension.
                    :orientation =>  'Landscape',
                    page_size:       'Letter'
      end
    end
  end

  def pdf
    if (params.has_key?(:hour_ids))
      client_id = (Hour.find_by id: params[:hour_ids].first).client_id
      params[:hour_ids].each do |value|
        hour = Hour.find_by id: value
        if client_id != hour.client_id
          redirect_to :controller => 'hours', :action => 'index', error_message: "You can't select two different clients in the same invoice. "
          return
        end
      end
      @new_invoice = Invoice.create
      params[:hour_ids].each do |value|
        @hour = Hour.find_by id: value
        @user = User.find_by id: @hour.user.id
        @client = Client.find_by id: @hour.client.id
        @hour.invoice_id = @new_invoice.id
        @new_invoice.total_amount += (@hour.end_time - @hour.start_time).to_i * (@user.tarif/3600)
        @hour.save if @hour.valid?
        @new_invoice.save if @new_invoice.valid?
      end
      @hours_to_bill = Hour.where(invoice_id: @new_invoice.id)
    else
      redirect_to :controller => 'hours', :action => 'index', error_message: "You need to at least check one hour."
      return
      #:controller => 'hours', :action => 'index', error_message: "Devi selezionare almeno un ora da fatturare"
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new(user: current_user)
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:id, :total_amount, :user_id, :client_id)
    end
end
