class EstadosController < ApplicationController
  before_action :set_estado, only: [:show, :edit, :update, :destroy]

  # GET /estados
  # GET /estados.json
  def index
    @estados = Estado.all
    @estado = Estado.new

    @caja = Caja.new
    @chequera = Chequera.new
    @cuenta_bancaria = CuentaBancaria.new
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @estados }
        format.pdf { render_estados_list(@estados) }
      end
  end

  # GET /estados/1
  # GET /estados/1.json
  def show
  end

  # GET /estados/new
  def new
    @estado = Estado.new
    respond_to do |format|
      format.js
    end
  end

  # GET /estados/1/edit
  def edit
    @estado = Estado.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /estados
  # POST /estados.json
  def create
    @estado = Estado.new(estado_params)

    respond_to do |format|
      if @estado.save
        format.html { redirect_to estados_url, notice: 'Estado was successfully created.' }
        format.json { render :show, status: :created, location: @estado }
        format.js
      else
        format.html { render :new }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estados/1
  # PATCH/PUT /estados/1.json
  def update
    respond_to do |format|
      if @estado.update(estado_params)
        format.html { redirect_to estados_url, notice: 'Estado was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado }
      else
        format.html { render :edit }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estados/1
  # DELETE /estados/1.json
  def destroy
    @estado.destroy
    respond_to do |format|
      format.html { redirect_to estados_url, notice: 'Estado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado
      @estado = Estado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_params
      params.require(:estado).permit(:descripcion)
    end

    def render_estados_list(estado)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'estados', 'show.tlf')

      estado.each do |task|
        report.list.add_row do |row|
          row.values no: task.id,
                     descripcion: task.descripcion
          row.item(:descripcion).style(:color, 'red')
        end
      end
     report.page.item(:logo).src = 'E:/Desarrollo/Ruby_on_rails/gestion/caja_banco/public/uploads/parametro/logo_empresa/3/logo.png'
      send_data report.generate, filename: 'estados.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end
