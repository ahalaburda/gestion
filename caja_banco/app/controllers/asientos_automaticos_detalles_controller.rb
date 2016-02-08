class AsientosAutomaticosDetallesController < ApplicationController
  before_action :set_asiento_automatico_detalle, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @asientos_automaticos_detalles = AsientoAutomaticoDetalle.all
    respond_with(@asientos_automaticos_detalles)
  end

  def show
    respond_with(@asiento_automatico_detalle)
  end

  def new
    @asiento_automatico_detalle = AsientoAutomaticoDetalle.new
    respond_with(@asiento_automatico_detalle)
  end

  def edit
  end

  def create
    @asiento_automatico_detalle = AsientoAutomaticoDetalle.new(asiento_automatico_detalle_params)
    @asiento_automatico_detalle.save
    respond_with(@asiento_automatico_detalle)
  end

  def update
    @asiento_automatico_detalle.update(asiento_automatico_detalle_params)
    respond_with(@asiento_automatico_detalle)
  end

  def destroy
    @asiento_automatico_detalle.destroy
    respond_with(@asiento_automatico_detalle)
  end

  private
    def set_asiento_automatico_detalle
      @asiento_automatico_detalle = AsientoAutomaticoDetalle.find(params[:id])
    end

    def asiento_automatico_detalle_params
      params.require(:asiento_automatico_detalle).permit(:asiento_automatico_id, :cuenta_id, :monto_debito, :monto_credito)
    end
end
