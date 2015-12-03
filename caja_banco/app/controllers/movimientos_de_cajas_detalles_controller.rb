class MovimientosDeCajasDetallesController < ApplicationController
  before_action :set_movimiento_de_caja_detalle, only: [:show, :edit, :update, :destroy]

  # GET /movimientos_de_cajas_detalles
  # GET /movimientos_de_cajas_detalles.json
  def index
    movimiento_de_caja = MovimientoDeCaja.find(params[:movimiento_de_caja_id])
    @movimientos_de_cajas_detalles = movimiento_de_caja.movimientos_de_cajas_detalles
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movimientos_de_cajas_detalles }
    end
  end

  # GET /movimientos_de_cajas_detalles/1
  # GET /movimientos_de_cajas_detalles/1.json
  def show
    movimiento_de_caja = MovimientoDeCaja.find(params[:movimiento_de_caja_id])
    @movimientos_de_cajas_detalles = movimiento_de_caja.movimientos_de_cajas_detalles.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movimientos_de_cajas_detalles }
    end
  end

  # GET /movimientos_de_cajas_detalles/new
  def new
    movimiento_de_caja = MovimientoDeCaja.find(params[:movimiento_de_caja_id])
    @movimiento_de_caja_detalle = movimiento_de_caja.movimientos_de_cajas_detalles.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movimiento_de_caja_detalle }
    end
  end

  # GET /movimientos_de_cajas_detalles/1/edit
  def edit
    movimiento_de_caja = MovimientoDeCaja.find(params[:movimiento_de_caja_id])
    @movimiento_de_caja_detalle = movimiento_de_caja.movimientos_de_cajas_detalles.find(params[:id])
  end

  # POST /movimientos_de_cajas_detalles
  # POST /movimientos_de_cajas_detalles.json
  def create
    movimiento_de_caja = MovimientoDeCaja.find(params[:movimiento_de_caja_id])
    @movimiento_de_caja_detalle = movimiento_de_caja.movimientos_de_cajas_detalles.create(params[:movimiento_de_caja])
    respond_to do |format|
      if @movimiento_de_caja_detalle.save
        format.html { redirect_to [@movimiento_de_caja_detalle.movimiento_de_caja, @movimiento_de_caja_detalle], notice: 'Movimiento de caja detalle was successfully created.' }
        format.json { render :show, status: :created, location: [@movimiento_de_caja_detalle.movimiento_de_caja, @movimiento_de_caja_detalle] }
      else
        format.html { render :new }
        format.json { render json: @movimiento_de_caja_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimientos_de_cajas_detalles/1
  # PATCH/PUT /movimientos_de_cajas_detalles/1.json
  def update
    movimiento_de_caja = MovimientoDeCaja.find(params[:movimiento_de_caja_id])
    @movimiento_de_caja_detalle = movimiento_de_caja.movimientos_de_cajas_detalles.find(params[:id])
    respond_to do |format|
      if @movimiento_de_caja_detalle.update(movimiento_de_caja_detalle_params)
        format.html { redirect_to [@movimiento_de_caja_detalle.movimiento_de_caja, @movimiento_de_caja_detalle], notice: 'Movimiento de caja detalle was successfully updated.' }
        format.json { render :show, status: :ok, location: [@movimiento_de_caja_detalle.movimiento_de_caja, @movimiento_de_caja_detalle] }
      else
        format.html { render :edit }
        format.json { render json: @movimiento_de_caja_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos_de_cajas_detalles/1
  # DELETE /movimientos_de_cajas_detalles/1.json
  def destroy
    movimiento_de_caja = MovimientoDeCaja.find(params[:movimiento_de_caja_id])
    @movimiento_de_caja_detalle = movimiento_de_caja.movimientos_de_cajas_detalles.find(params[:id])
    @movimiento_de_caja_detalle.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Movimiento de caja detalle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento_de_caja_detalle
      @movimiento_de_caja_detalle = MovimientoDeCajaDetalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_de_caja_detalle_params
      params.require(:movimiento_de_caja_detalle).permit(:movimiento_de_caja_id, :cheque_entrante_id, :cheque_propio_id, :monto_efectivo, :monto_cheque)
    end
    def set_movimiento_de_caja
      @movimiento_de_caja = MovimientoDeCaja.find(params[:movimiento_de_caja_id])
    end
end
