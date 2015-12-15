class ChequerasController < ApplicationController
  before_action :set_chequera, only: [:show, :edit, :update, :destroy]

  # GET /chequeras
  # GET /chequeras.json
  def index
    @chequeras = Chequera.all
    @chequera = Chequera.new
    @cuenta_bancaria = CuentaBancaria.new
    @cheque_propio = ChequePropio.new
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @chequeras }
        format.pdf { render_chequera_list(@chequeras) }
    end
  end

  # GET /chequeras/1
  # GET /chequeras/1.json
  def show
  end

  # GET /chequeras/new
  def new
    @chequera = Chequera.new
    respond_to do |format|
      format.js
    end
  end

  # GET /chequeras/1/edit
  def edit
    @chequera = Chequera.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /chequeras
  # POST /chequeras.json
  def create
    @chequera = Chequera.new(chequera_params)
    respond_to do |format|
      if @chequera.save
        format.html { redirect_to chequeras_url, notice: 'Chequera was successfully created.' }
        format.json { render :show, status: :created, location: @chequera }
        format.js
      else
        format.html { render :new }
        format.json { render json: @chequera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chequeras/1
  # PATCH/PUT /chequeras/1.json
  def update
    respond_to do |format|
      if @chequera.update(chequera_params)
        format.html { redirect_to chequeras_url, notice: 'Chequera was successfully updated.' }
        format.json { render :show, status: :ok, location: @chequera }
      else
        format.html { render :edit }
        format.json { render json: @chequera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chequeras/1
  # DELETE /chequeras/1.json
  def destroy
    @chequera.destroy
    respond_to do |format|
      format.html { redirect_to chequeras_url, notice: 'Chequera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chequera
      @chequera = Chequera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chequera_params
      params.require(:chequera).permit(:cuenta_bancaria_id, :estado_id, :numero_cheque_inicial, :numero_cheque_final)
    end

    def render_chequera_list(chequera)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'chequeras', 'show.tlf')

      chequera.each do |chequera|
        report.list.add_row do |row|
          row.values cuenta_bancaria: chequera.cuenta_bancaria.numero_cuenta,
                     estado: chequera.estado.descripcion,
                     numero_cheque_inicial: chequera.numero_cheque_inicial,
                     numero_cheque_final: chequera.numero_cheque_final
          row.item(:cuenta_bancaria).style(:color, 'red')
          row.item(:estado).style(:color, 'red')
          row.item(:numero_cheque_inicial).style(:color, 'red')
          row.item(:numero_cheque_final).style(:color, 'red')
        end
      end
    report.page.item(:logo).src = 'E:/Desarrollo/Ruby_on_rails/gestion/caja_banco/public/uploads/parametro/logo_empresa/3/logo.png'
    report.page.item(:elaboracion).value(current_user.username)
    report.page.item(:fecha_elaboracion).value(Time.current.to_s)
      send_data report.generate, filename: 'chequeras.pdf',
                                   type: 'application/pdf',
                                   disposition: 'attachment'
    end
end