class MovimientosDeCajasController < ApplicationController
  before_action :set_movimiento_de_caja, only: [:show, :edit, :update, :destroy]

  # GET /movimientos_de_cajas
  # GET /movimientos_de_cajas.json
  def index
    @movimientos_de_cajas = MovimientoDeCaja.all
    @movimiento_de_caja = MovimientoDeCaja.new
    @movimiento_de_caja_detalle = MovimientoDeCajaDetalle.new
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
        format.html { redirect_to @movimiento_de_caja, notice: 'Movimiento de caja was successfully created.' }
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
        format.html { redirect_to @movimiento_de_caja, notice: 'Movimiento de caja was successfully updated.' }
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
    @movimiento_de_caja.destroy
    respond_to do |format|
      format.html { redirect_to movimientos_de_cajas_url, notice: 'Movimiento de caja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento_de_caja
      @movimiento_de_caja = MovimientoDeCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_de_caja_params
      params.require(:movimiento_de_caja).permit(:tipo_de_movimiento_id, :caja_id, :descripcion, :fecha, movimientos_de_cajas_detalles_attributes: [:id, :descripcion, :cheque_propio_id, :cheque_entrante_id, :monto_cheque, :monto_efectivo])
    end
end
