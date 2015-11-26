class AperturaCajasController < ApplicationController
  before_action :set_apertura_caja, only: [:show, :edit, :update, :destroy]

  # GET /apertura_cajas
  # GET /apertura_cajas.json
  def index
    @apertura_cajas = AperturaCaja.all
    @apertura_caja = AperturaCaja.new
    @caja = Caja.new
  end

  # GET /apertura_cajas/1
  # GET /apertura_cajas/1.json
  def show
  end

  # GET /apertura_cajas/new
  def new
    @apertura_caja = AperturaCaja.new
    respond_to do |format|
      format.js
    end
  end

  # GET /apertura_cajas/1/edit
  def edit
    @apertura_caja = AperturaCaja.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /apertura_cajas
  # POST /apertura_cajas.json
  def create
    @apertura_caja = AperturaCaja.new(apertura_caja_params)

    respond_to do |format|
      if @apertura_caja.save
        format.html { redirect_to apertura_cajas_url, notice: 'Apertura caja was successfully created.' }
        format.json { render :show, status: :created, location: @apertura_caja }
        format.js
      else
        format.html { render :new }
        format.json { render json: @apertura_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apertura_cajas/1
  # PATCH/PUT /apertura_cajas/1.json
  def update
    respond_to do |format|
      if @apertura_caja.update(apertura_caja_params)
        format.html { redirect_to apertura_cajas_url, notice: 'Apertura caja was successfully updated.' }
        format.json { render :show, status: :ok, location: @apertura_caja }
      else
        format.html { render :edit }
        format.json { render json: @apertura_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apertura_cajas/1
  # DELETE /apertura_cajas/1.json
  def destroy
    @apertura_caja.destroy
    respond_to do |format|
      format.html { redirect_to apertura_cajas_url, notice: 'Apertura caja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apertura_caja
      @apertura_caja = AperturaCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apertura_caja_params
      params.require(:apertura_caja).permit(:caja_id, :apertura, :cierre, :saldo_inicial_efectivo, :saldo_inicial_cheque, :saldo_final_efectivo, :saldo_final_cheque, :persona_id)
    end
end
