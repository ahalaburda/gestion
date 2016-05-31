class MovimientosDeCajasController < ApplicationController
  before_action :set_movimiento_de_caja, only: [:show, :edit, :update, :destroy]

  # GET /movimientos_de_cajas
  # GET /movimientos_de_cajas.json
  def index
    @cheque_entrante = ChequeEntrante.new
    apertura = AperturaCaja.where(id: params[:apertura_id])
    @apertura_caja = apertura.empty? ? AperturaCaja.new : apertura.first

    @movimientos_de_cajas = MovimientoDeCaja.all
    @movimiento_de_caja = MovimientoDeCaja.new
    @movimiento_de_caja.movimientos_de_cajas_detalles.build
    @movimiento_de_caja_detalle = MovimientoDeCajaDetalle.new
    @movimientos_de_cajas_detalles = MovimientoDeCajaDetalle.all
  end

  # GET /movimientos_de_cajas/1
  # GET /movimientos_de_cajas/1.json
  def show
    @movimiento_de_caja_detalle = MovimientoDeCajaDetalle.new
    @movimientos_de_cajas_detalles = MovimientoDeCajaDetalle.all
  end

  # GET /movimientos_de_cajas/new
  def new
    @movimiento_de_caja = MovimientoDeCaja.new
    @cheque_entrante = ChequeEntrante.new
  end

  # GET /movimientos_de_cajas/1/edit
  def edit
  end

  # POST /movimientos_de_cajas
  # POST /movimientos_de_cajas.json
  def create
    @movimiento_de_caja = MovimientoDeCaja.new(movimiento_de_caja_params)

    respond_to do |format|
      if @movimiento_de_caja.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @movimiento_de_caja }
      else
        format.html { render :new }
        format.json { render json: @movimiento_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimientos_de_cajas/1
  # PATCH/PUT /movimientos_de_cajas/1.json
  def update
    respond_to do |format|
      if @movimiento_de_caja.update(movimiento_de_caja_params)
        format.html { redirect_to @movimiento_de_caja }
        format.json { render :show, status: :ok, location: @movimiento_de_caja }
      else
        format.html { render :edit }
        format.json { render json: @movimiento_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos_de_cajas/1
  # DELETE /movimientos_de_cajas/1.json
  def destroy
    respond_to do |format|
      if @movimiento_de_caja.destroy
        format.html { redirect_to :back }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'No se puede eliminar.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento_de_caja
      @movimiento_de_caja = MovimientoDeCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_de_caja_params
      params.require(:movimiento_de_caja).permit(:tipo_de_movimiento_id, :caja_id, :apertura_id, :descripcion, :fecha, :total, :monto_total_efectivo, :monto_total_cheque, movimientos_de_cajas_detalles_attributes: [:id, :cheque_propio_id, :cheque_entrante_id, :monto_cheque, :monto_efectivo])
    end
end
