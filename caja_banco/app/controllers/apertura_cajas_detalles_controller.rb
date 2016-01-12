class AperturaCajasDetallesController < ApplicationController
  before_action :set_apertura_cajas_detalle, only: [:show, :edit, :update, :destroy]

  def index
    @apertura_caja = AperturaCajas.find(params[:apertura_caja_id])
    @apertura_cajas_detalles = @apertura_caja.apertura_cajas_detalles
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @apertura_cajas_detalles }
    end

  end

  def show
    @apertura_caja = AperturaCajas.find(params[:apertura_caja_id])
    @apertura_cajas_detalles = @apertura_caja.apertura_cajas_detalles.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @apertura_cajas_detalles }
    end
  end

  def new
    @apertura_caja = AperturaCajas.find(params[:apertura_caja_id])
    @apertura_cajas_detalle = @apertura_caja.apertura_cajas_detalles.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @apertura_cajas_detalle }
    end
  end

  def edit
    @apertura_caja = AperturaCajas.find(params[:apertura_caja_id])
    @apertura_cajas_detalles = @apertura_caja.apertura_cajas_detalles.find(params[:id])
  end

  def create
    @apertura_caja = AperturaCajas.find(params[:apertura_caja_id])
    @apertura_cajas_detalle = @apertura_caja.apertura_cajas_detalles.create(params[:apertura_caja])
    respond_to do |format|
      if @apertura_cajas_detalle.save
        format.html { redirect_to [@apertura_cajas_detalle.apertura_caja, @apertura_cajas_detalle], notice: 'Detalle de la apertura de caja creada' }
        format.json { render :show, status: :created, location: [@apertura_cajas_detalle.apertura_caja, @apertura_cajas_detalle] }
      else
        format.html { render :new }
        format.json { render json: @apertura_cajas_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @apertura_caja = AperturaCajas.find(params[:apertura_caja_id])
    @apertura_cajas_detalle = @apertura_caja.apertura_cajas_detalles.find(params[:id])
    respond_to do |format|
      if @apertura_cajas_detalle.update(apertura_cajas_detalle_params)
        format.html { redirect_to [@apertura_cajas_detalle.apertura_caja, @apertura_cajas_detalle], notice: 'Detalle de la apertura de caja actualizado' }
        format.json { render :show, status: :created, location: [@apertura_cajas_detalle.apertura_caja, @apertura_cajas_detalle] }
      else
        format.html { render :new }
        format.json { render json: @apertura_cajas_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @apertura_caja = AperturaCajas.find(params[:apertura_caja_id])
    @apertura_cajas_detalles = @apertura_caja.apertura_cajas_detalles.find(params[:id])
    @apertura_cajas_detalle.destroy
    respond_to do |format|
      format.html { redirect_to @apertura_caja, notice: 'Detalle de la apertura de caja eliminada' }
      format.json { head :no_content }
    end
  end

  private
    def set_apertura_caja
      @apertura_caja = AperturaCaja.find(params[:id])
    end
    def set_apertura_cajas_detalle
      @apertura_cajas_detalle = AperturaCajasDetalle.find(params[:id])
    end

    def apertura_cajas_detalle_params
      params.require(:apertura_cajas_detalle).permit(:apertura_caja_id, :cheque_entrante_id, :monto)
    end
end
