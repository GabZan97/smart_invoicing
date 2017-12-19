class ClientsController < ApplicationController
  before_action :require_login
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.where(user_id: current_user.id)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @hours = Hour.where(user_id: current_user.id, client_id: @client.id).to_a
    invoices_hid = @hours.uniq.pluck(:invoice_id)
    @invoices = Invoice.where(id: invoices_hid)
  end

  # GET /clients/new
  def new
    @client = Client.new
    @client.user_id = current_user.id
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Added new client.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Updated client' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    if !@client.hours.empty?
      @client.hours.each do |hour|
        hour.invoice.destroy unless hour.invoice==nil
        hour.destroy
      end
    end
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Deleted client.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :codice_fiscale, :email, :partita_iva, :user_id)
    end
end
