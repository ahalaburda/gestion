class MovimientosDeBancosDetallesController < ApplicationController
  before_action :set_movimiento_de_banco_detalle, only: [:show, :edit, :update, :destroy]

  # GET /movimientos_de_bancos_detalles
  # GET /movimientos_de_bancos_detalles.json
  def index
    movimiento_de_banco = MovimientoDeBanco.find(params[:movimiento_de_banco_id])
    @movimientos_de_bancos_detalles = movimiento_de_banco.movimientos_de_bancos_detalles
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movimientos_de_bancos_detalles }
    end
  end

  # GET /movimientos_de_bancos_detalles/1
  # GET /movimientos_de_bancos_detalles/1.json
  def show
    movimiento_de_banco = MovimientoDeBanco.find(params[:movimiento_de_banco_id])
    @movimientos_de_bancos_detalles = movimiento_de_banco.movimientos_de_bancos_detalles.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movimientos_de_bancos_detalles }
    end
  end

  # GET /movimientos_de_bancos_detalles/new
  def new
    movimiento_de_banco = MovimientoDeBanco.find(params[:movimiento_de_banco_id])
    @movimiento_de_banco_detalle = movimiento_de_banco.movimientos_de_bancos_detalles.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movimiento_de_banco_detalle }
    end
  end

  # GET /movimientos_de_bancos_detalles/1/edit
  def edit
    movimiento_de_banco = MovimientoDeBanco.find(params[:movimiento_de_banco_id])
    @movimiento_de_banco_detalle = movimiento_de_banco.movimientos_de_bancos_detalles.find(params[:id])
  end

  # POST /movimientos_de_bancos_detalles
  # POST /movimientos_de_bancos_detalles.json
  def create
    movimiento_de_banco = MovimientoDeBanco.find(params[:movimiento_de_banco_id])
    @movimiento_de_banco_detalle = movimiento_de_banco.movimientos_de_bancos_detalles.create(params[:movimiento_de_banco])
    respond_to do |format|
      if @movimiento_de_banco_detalle.save
        format.html { redirect_to [@movimiento_de_banco_detalle.movimiento_de_banco, @movimiento_de_banco_detalle], notice: 'Movimiento de banco detalle was successfully created.' }
        format.json { render :show, status: :created, location: [@movimiento_de_banco_detalle.movimiento_de_banco, @movimiento_de_banco_detalle] }
      else
        format.html { render :new }
        format.json { render json: @movimiento_de_banco_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimientos_de_bancos_detalles/1
  # PATCH/PUT /movimientos_de_bancos_detalles/1.json
  def update
    movimiento_de_banco = MovimientoDeBanco.find(params[:movimiento_de_banco_id])
    @movimiento_de_banco_detalle = movimiento_de_banco.movimientos_de_bancos_detalles.find(params[:id])
    respond_to do |format|
      if @movimiento_de_banco_detalle.update(movimiento_de_banco_detalle_params)
        format.html { redirect_to [@movimiento_de_banco_detalle.movimiento_de_banco, @movimiento_de_banco_detalle], notice: 'Movimiento de banco detalle was successfully updated.' }
        format.json { render :show, status: :ok, location: [@movimiento_de_banco_detalle.movimiento_de_banco, @movimiento_de_banco_detalle] }
      else
        format.html { render :edit }
        format.json { render json: @movimiento_de_banco_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos_de_bancos_detalles/1
  # DELETE /movimientos_de_bancos_detalles/1.json
  def destroy
    movimiento_de_banco = MovimientoDeBanco.find(params[:movimiento_de_banco_id])
    @movimiento_de_banco_detalle = movimiento_de_banco.movimientos_de_bancos_detalles.find(params[:id])
    @movimiento_de_banco_detalle.destroy

    respond_to do |format|
      format.html { redirect_to @movimiento_de_banco, notice: 'Movimiento de banco detalle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento_de_banco_detalle
      @movimiento_de_banco_detalle = MovimientoDeBancoDetalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_de_banco_detalle_params
      params.require(:movimiento_de_banco_detalle).permit(:movimiento_de_banco_id, :cuenta_bancaria_id, :descripcion, :monto)
    end
    def set_movimiento_de_banco
      @movimiento_de_banco = MovimientoDeBanco.find(params[:movimiento_de_banco_id])
    end
end
