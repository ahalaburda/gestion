class CajasController < ApplicationController
  before_action :set_caja, only: [:show, :edit, :update, :destroy]

  # GET /cajas
  # GET /cajas.json
  def index
    @apertura_cajas = AperturaCaja.all
    @apertura_caja = AperturaCaja.new
    @apertura_cajas_detalles = AperturaCajasDetalle.all
    @apertura_cajas_detalle = AperturaCajasDetalle.new
    @apertura_caja.apertura_cajas_detalles.build
    @caja = Caja.new
    @cajas = Caja.all.order('numero asc')
     respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @cajas }
        format.xls { send_data @cajas.to_xls(
          :columns => [ :numero,:estado_id, :created_at, :updated_at],
          :headers => [ "Numero", "Estado", "Fecha de Creacion", "Fecha de actualizacion"] ),
          :filename => 'cajas.xls' }
        format.pdf { render_caja_list(@cajas) }
    end
  end

  # GET /cajas/1
  # GET /cajas/1.json
  def show
  end

  # GET /cajas/new
  def new
    @caja = Caja.new
  end

  # GET /cajas/1/edit
  def edit
    @caja = Caja.find(params[:id])
     respond_to do |format|
      format.js
    end
  end

  # POST /cajas
  # POST /cajas.json
  def create
    @caja = Caja.new(caja_params)

    respond_to do |format|
      if @caja.save
        format.html { redirect_to cajas_url }
        format.json { render :show, status: :created, location: @caja }
      else
        format.html { render :new }
        format.json { render json: @caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cajas/1
  # PATCH/PUT /cajas/1.json
  def update
    respond_to do |format|
      if @caja.update(caja_params)
        format.html { redirect_to cajas_url }
        format.json { render :show, status: :ok, location: @caja }
      else
        format.html { render :edit }
        format.json { render json: @caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cajas/1
  # DELETE /cajas/1.json
  def destroy
    respond_to do |format|
      if @caja.destroy
        format.html { redirect_to cajas_url }
        format.json { head :no_content }
      else
        format.html { redirect_to cajas_url, notice: 'No se puede eliminar.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caja
      @caja = Caja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caja_params
      params.require(:caja).permit(:apertura, :cierre, :saldo_inicial_efectivo, :saldo_inicial_cheque, :saldo_final_efectivo, :saldo_final_cheque, :estado_id, :persona_id, :numero)
    end

    def render_caja_list(caja)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cajas', 'show.tlf')

      caja.each do |task|
        report.list.add_row do |row|
          row.values no: task.numero,
                     apertura: task.apertura,
                     cierre: task.cierre,
                     saldo_inicial_efectivo: task.saldo_inicial_efectivo,
                     saldo_inicial_cheque: task.saldo_inicial_cheque,
                     saldo_final_efectivo: task.saldo_final_efectivo,
                     saldo_final_cheque: task.saldo_final_cheque,
                     estado: task.estado.descripcion,
                     cajero: task.persona.nombre_apellido
          row.item(:apertura).style(:color, 'red')
          row.item(:cierre).style(:color, 'red')
          row.item(:saldo_inicial_efectivo).style(:color, 'red')
          row.item(:saldo_inicial_cheque).style(:color, 'red')
          row.item(:saldo_final_efectivo).style(:color, 'red')
          row.item(:saldo_final_cheque).style(:color, 'red')
          row.item(:estado).style(:color, 'red')
          row.item(:cajero).style(:color, 'red')
        end
      end

      send_data report.generate, filename: 'cajas.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end
