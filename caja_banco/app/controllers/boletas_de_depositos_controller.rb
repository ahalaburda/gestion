class BoletasDeDepositosController < ApplicationController
  before_action :set_boleta_de_deposito, only: [:show, :edit, :update, :destroy]

  # GET /boletas_de_depositos
  # GET /boletas_de_depositos.json
  def index
    @boletas_de_depositos = BoletaDeDeposito.all
    @boleta_de_deposito = BoletaDeDeposito.new
  end

  # GET /boletas_de_depositos/1
  # GET /boletas_de_depositos/1.json
  def show
    @boleta_de_deposito_detalle = BoletaDeDepositoDetalle.new
    @boletas_de_depositos_detalles = BoletaDeDepositoDetalle.all
  end

  # GET /boletas_de_depositos/new
  def new
    @boleta_de_deposito = BoletaDeDeposito.new
  end

  # GET /boletas_de_depositos/1/edit
  def edit
  end

  # POST /boletas_de_depositos
  # POST /boletas_de_depositos.json
  def create
    @boleta_de_deposito = BoletaDeDeposito.new(boleta_de_deposito_params)

    respond_to do |format|
      if @boleta_de_deposito.save
        format.html { redirect_to @boleta_de_deposito, notice: 'Boleta de deposito was successfully created.' }
        format.json { render :show, status: :created, location: @boleta_de_deposito }
      else
        format.html { render :new }
        format.json { render json: @boleta_de_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boletas_de_depositos/1
  # PATCH/PUT /boletas_de_depositos/1.json
  def update
    respond_to do |format|
      if @boleta_de_deposito.update(boleta_de_deposito_params)
        format.html { redirect_to @boleta_de_deposito, notice: 'Boleta de deposito was successfully updated.' }
        format.json { render :show, status: :ok, location: @boleta_de_deposito }
      else
        format.html { render :edit }
        format.json { render json: @boleta_de_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boletas_de_depositos/1
  # DELETE /boletas_de_depositos/1.json
  def destroy
    @boleta_de_deposito.destroy
    respond_to do |format|
      format.html { redirect_to boletas_de_depositos_url, notice: 'Boleta de deposito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boleta_de_deposito
      @boleta_de_deposito = BoletaDeDeposito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boleta_de_deposito_params
      params.require(:boleta_de_deposito).permit(:banco_id, :persona_id, :cuenta_bancaria_id, :caja_id, :fecha, numero)
    end
end
