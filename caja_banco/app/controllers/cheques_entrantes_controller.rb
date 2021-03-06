class ChequesEntrantesController < ApplicationController
  before_action :set_cheque_entrante, only: [:show, :edit, :update, :destroy]

  # GET /cheques_entrantes
  # GET /cheques_entrantes.json
  def index
    @movimiento_de_caja = MovimientoDeCaja.new
    @movimiento_de_caja_detalle = MovimientoDeCajaDetalle.new

    @cheques_entrantes = ChequeEntrante.all
    @cheque_entrante = ChequeEntrante.new
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @cheques_entrantes }
        format.pdf { render_cheque_entrante_list(@cheques_entrantes) }
    end
  end

  # GET /cheques_entrantes/1
  # GET /cheques_entrantes/1.json
  def show
  end

  # GET /cheques_entrantes/new
  def new
    @cheque_entrante = ChequeEntrante.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /cheques_entrantes/1/edit
  def edit
    @cheque_entrante = ChequeEntrante.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /cheques_entrantes
  # POST /cheques_entrantes.json
  def create
    @cheque_entrante = ChequeEntrante.new(cheque_entrante_params)

    respond_to do |format|
      if @cheque_entrante.save
        format.html { redirect_to :back  }
        format.json { render :show, status: :created, location: @cheque_entrante }
        format.js
      else
        format.html { render :new }
        format.json { render json: @cheque_entrante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheques_entrantes/1
  # PATCH/PUT /cheques_entrantes/1.json
  def update
    respond_to do |format|
      if @cheque_entrante.update(cheque_entrante_params)
        format.html { redirect_to cheques_entrantes_url }
        format.json { render :show, status: :ok, location: @cheque_entrante }
      else
        format.html { render :edit }
        format.json { render json: @cheque_entrante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheques_entrantes/1
  # DELETE /cheques_entrantes/1.json
  def destroy
    respond_to do |format|
      if @cheque_entrante.destroy
        format.html { redirect_to cheques_entrantes_url }
        format.json { head :no_content }
      else
        format.html { redirect_to cheques_entrantes_url, notice: 'No se puede eliminar.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheque_entrante
      @cheque_entrante = ChequeEntrante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheque_entrante_params
      params.require(:cheque_entrante).permit(:banco_id, :numero, :fecha, :monto, :persona_id, :caja_id, :estado_id)
    end

    def render_cheque_entrante_list(cheque_entrante)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cheques_entrantes', 'show.tlf')

      cheque_entrante.each do |task|
        report.list.add_row do |row|
          row.values banco: task.banco.banco_sucursal,
                     numero: task.numero,
                     fecha: task.fecha,
                     monto: task.monto,
                     persona: task.persona.nombre_apellido
          row.item(:banco).style(:color, 'red')
          row.item(:numero).style(:color, 'red')
          row.item(:fecha).style(:color, 'red')
          row.item(:monto).style(:color, 'red')
          row.item(:persona).style(:color, 'red')
        end
      end
    report.page.item(:logo).src = File.join(Rails.root, 'public','uploads', 'parametro', 'logo_empresa', '3', 'logo.png')
    report.page.item(:elaboracion).value(current_user.username)
    report.page.item(:fecha_elaboracion).value(Time.current.to_s)
      send_data report.generate, filename: 'cheques_entrantes.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end
