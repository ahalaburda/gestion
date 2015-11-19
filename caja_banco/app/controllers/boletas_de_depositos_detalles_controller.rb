class BoletasDeDepositosDetallesController < ApplicationController
  before_action :set_boleta_de_deposito_detalle, only: [:show, :edit, :update, :destroy]

  # GET /boletas_de_depositos_detalles
  # GET /boletas_de_depositos_detalles.json
  def index
    @boleta_de_deposito = BoletaDeDeposito.find(params[:boleta_de_deposito_id])
    @boletas_de_depositos_detalles = @boleta_de_deposito.boletas_de_depositos_detalles
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boletas_de_depositos_detalles }
    end
  end

  # GET /boletas_de_depositos_detalles/1
  # GET /boletas_de_depositos_detalles/1.json
  def show
    @boleta_de_deposito = BoletaDeDeposito.find(params[:boleta_de_deposito_id])
    @boletas_de_depositos_detalles = @boleta_de_deposito.boletas_de_depositos_detalles.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @boletas_de_depositos_detalles }
    end
  end

  # GET /boletas_de_depositos_detalles/new
  def new
    @boleta_de_deposito = BoletaDeDeposito.find(params[:boleta_de_deposito_id])
    @boleta_de_deposito_detalle = @boleta_de_deposito.boletas_de_depositos_detalles.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @boleta_de_deposito_detalle }
    end
  end

  # GET /boletas_de_depositos_detalles/1/edit
  def edit
    @boleta_de_deposito = BoletaDeDeposito.find(params[:boleta_de_deposito_id])
    @boleta_de_deposito_detalle = @boleta_de_deposito.boletas_de_depositos_detalles.find(params[:id])
  end

  # POST /boletas_de_depositos_detalles
  # POST /boletas_de_depositos_detalles.json
  def create
    @boleta_de_deposito = BoletaDeDeposito.find(params[:boleta_de_deposito_id])
    @boleta_de_deposito_detalle = @boleta_de_deposito.boletas_de_depositos_detalles.create(params[:boleta_de_deposito])
    respond_to do |format|
      if @boleta_de_deposito_detalle.save
        format.html { redirect_to [@boleta_de_deposito_detalle.boleta_de_deposito, @boleta_de_deposito_detalle], notice: 'Boleta de deposito detalle was successfully created.' }
        format.json { render :show, status: :created, location: [@boleta_de_deposito_detalle.boleta_de_deposito, @boleta_de_deposito_detalle] }
      else
        format.html { render :new }
        format.json { render json: @boleta_de_deposito_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boletas_de_depositos_detalles/1
  # PATCH/PUT /boletas_de_depositos_detalles/1.json
  def update
    @boleta_de_deposito = BoletaDeDeposito.find(params[:boleta_de_deposito_id])
    @boleta_de_deposito_detalle = @boleta_de_deposito.boletas_de_depositos_detalles.find(params[:id])
    respond_to do |format|
      if @boleta_de_deposito_detalle.update(boleta_de_deposito_detalle_params)
        format.html { redirect_to [@boleta_de_deposito_detalle.boleta_de_deposito, @boleta_de_deposito_detalle], notice: 'Boleta de deposito detalle was successfully updated.' }
        format.json { render :show, status: :ok, location: [@boleta_de_deposito_detalle.boleta_de_deposito, @boleta_de_deposito_detalle] }
      else
        format.html { render :edit }
        format.json { render json: @boleta_de_deposito_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boletas_de_depositos_detalles/1
  # DELETE /boletas_de_depositos_detalles/1.json
  def destroy
    @boleta_de_deposito = BoletaDeDeposito.find(params[:boleta_de_deposito_id])
    @boleta_de_deposito_detalle = @boleta_de_deposito.boletas_de_depositos_detalles.find(params[:id])
    @boleta_de_deposito_detalle.destroy

    respond_to do |format|
      format.html { redirect_to @boleta_de_deposito, notice: 'Boleta de deposito detalle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boleta_de_deposito_detalle
      @boleta_de_deposito_detalle = BoletaDeDepositoDetalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boleta_de_deposito_detalle_params
      params.require(:boleta_de_deposito_detalle).permit(:boleta_de_deposito_id, :cheque_entrante_id, :monto_efectivo, :monto_cheque, :total)
    end
    def set_boleta_de_deposito
      @boleta_de_deposito = BoletaDeDeposito.find(params[:boleta_de_deposito_id])
    end
end
