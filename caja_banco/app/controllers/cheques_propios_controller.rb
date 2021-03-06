class ChequesPropiosController < ApplicationController
  before_action :set_cheque_propio, only: [:show, :edit, :update, :destroy]

  # GET /cheques_propios
  # GET /cheques_propios.json
  def index
    @movimiento_de_caja = MovimientoDeCaja.new
    @movimiento_de_caja_detalle = MovimientoDeCajaDetalle.new

    @cheques_propios = ChequePropio.all
    @cheque_propio = ChequePropio.new
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @cheques_propios }
        format.pdf { render_cheque_propio_list(@cheques_propios) }
    end
  end
  # GET /cheques_propios/1
  # GET /cheques_propios/1.json
  def show
  end
  # GET /cheques_propios/new
  def new
    @cheque_propio = ChequePropio.new
    respond_to do |format|
      format.js
    end
  end
  # GET /cheques_propios/1/edit
  def edit
    @cheque_propio = ChequePropio.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  # POST /cheques_propios
  # POST /cheques_propios.json
  def create
    @cheque_propio = ChequePropio.new(cheque_propio_params)

    respond_to do |format|
      if @cheque_propio.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @cheque_propio }
        format.js
      else
        format.html { render :new }
        format.json { render json: @cheque_propio.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /cheques_propios/1
  # PATCH/PUT /cheques_propios/1.json
  def update
    respond_to do |format|
      if @cheque_propio.update(cheque_propio_params)
        format.html { redirect_to cheques_propios_url }
        format.json { render :show, status: :ok, location: @cheque_propio }
      else
        format.html { render :edit }
        format.json { render json: @cheque_propio.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /cheques_propios/1
  # DELETE /cheques_propios/1.json
  def destroy
    respond_to do |format|
      if @cheque_propio.destroy
        format.html { redirect_to cheques_propios_url }
        format.json { head :no_content }
      else
        format.html { redirect_to cheques_propios_url, notice: 'No se puede eliminar' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheque_propio
      @cheque_propio = ChequePropio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheque_propio_params
      params.require(:cheque_propio).permit(:chequera_id, :numero_cheque, :fecha, :concepto, :monto)
    end

    def render_cheque_propio_list(cheque_propio)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cheques_propios', 'show.tlf')

      cheque_propio.each do |task|
        report.list.add_row do |row|
          row.values chequera: task.chequera_id,
                     numero_cheque: task.numero_cheque,
                     fecha: task.fecha,
                     concepto: task.concepto,
                     monto: task.monto
          row.item(:chequera).style(:color, 'red')
          row.item(:numero_cheque).style(:color, 'red')
          row.item(:fecha).style(:color, 'red')
          row.item(:concepto).style(:color, 'red')
          row.item(:monto).style(:color, 'red')
        end
      end
    report.page.item(:logo).src = File.join(Rails.root, 'public','uploads', 'parametro', 'logo_empresa', '3', 'logo.png')
    report.page.item(:elaboracion).value(current_user.username)
    report.page.item(:fecha_elaboracion).value(Time.current.to_s)
      send_data report.generate, filename: 'cheques_propios.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end