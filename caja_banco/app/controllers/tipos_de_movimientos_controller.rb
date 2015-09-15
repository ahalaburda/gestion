class TiposDeMovimientosController < ApplicationController
  before_action :set_tipo_de_movimiento, only: [:show, :edit, :update, :destroy]

  # GET /tipos_de_movimientos
  # GET /tipos_de_movimientos.json
  def index
    @tipos_de_movimientos = TipoDeMovimiento.all
    @tipo_de_movimiento = TipoDeMovimiento.new
  end

  # GET /tipos_de_movimientos/1
  # GET /tipos_de_movimientos/1.json
  def show
  end

  # GET /tipos_de_movimientos/new
  def new
    @tipo_de_movimiento = TipoDeMovimiento.new
  end

  # GET /tipos_de_movimientos/1/edit
  def edit
  end

  # POST /tipos_de_movimientos
  # POST /tipos_de_movimientos.json
  def create
    @tipo_de_movimiento = TipoDeMovimiento.new(tipo_de_movimiento_params)

    respond_to do |format|
      if @tipo_de_movimiento.save
        format.html { redirect_to tipos_de_movimientos_url, notice: 'Tipo de movimiento was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_de_movimiento }
      else
        format.html { render :new }
        format.json { render json: @tipo_de_movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos_de_movimientos/1
  # PATCH/PUT /tipos_de_movimientos/1.json
  def update
    respond_to do |format|
      if @tipo_de_movimiento.update(tipo_de_movimiento_params)
        format.html { redirect_to @tipo_de_movimiento, notice: 'Tipo de movimiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_de_movimiento }
      else
        format.html { render :edit }
        format.json { render json: @tipo_de_movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_movimientos/1
  # DELETE /tipos_de_movimientos/1.json
  def destroy
    @tipo_de_movimiento.destroy
    respond_to do |format|
      format.html { redirect_to tipos_de_movimientos_url, notice: 'Tipo de movimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_de_movimiento
      @tipo_de_movimiento = TipoDeMovimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_de_movimiento_params
      params.require(:tipo_de_movimiento).permit(:descripcion)
    end
end
