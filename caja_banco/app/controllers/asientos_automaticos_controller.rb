class AsientosAutomaticosController < ApplicationController
  before_action :set_asiento_automatico, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @asientos_automaticos = AsientoAutomatico.all
    respond_with(@asientos_automaticos)
  end

  def show
@asientos_automaticos_detalles = AsientoAutomaticoDetalle.all
    respond_with(@asiento_automatico)
  end

  def new
    @asiento_automatico = AsientoAutomatico.new
    respond_with(@asiento_automatico)
  end

  def edit
  end

  def create
    @asiento_automatico = AsientoAutomatico.new(asiento_automatico_params)
    @asiento_automatico.save
    respond_with(@asiento_automatico)
  end

  def update
    @asiento_automatico.update(asiento_automatico_params)
    respond_with(@asiento_automatico)
  end

  def destroy
    @asiento_automatico.destroy
    respond_with(@asiento_automatico)
  end

  private
    def set_asiento_automatico
      @asiento_automatico = AsientoAutomatico.find(params[:id])
    end

    def asiento_automatico_params
      params.require(:asiento_automatico).permit(:tipo_de_asiento, :descripcion, :fecha)
    end
end
