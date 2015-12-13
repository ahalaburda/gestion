class CuentasBancariasController < ApplicationController
  before_action :set_cuenta_bancaria, only: [:show, :edit, :update, :destroy]

  # GET /cuentas_bancarias
  # GET /cuentas_bancarias.json
  def index
    @cuentas_bancarias = CuentaBancaria.all
    @cuenta_bancaria = CuentaBancaria.new

    @chequera = Chequera.new
    @firmante = Firmante.new
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @cuentas_bancarias }
        format.pdf { render_cuenta_bancaria_list(@cuentas_bancarias) }
    end
  end

  # GET /cuentas_bancarias/1
  # GET /cuentas_bancarias/1.json
  def show
  end

  # GET /cuentas_bancarias/new
  def new
    @cuenta_bancaria = CuentaBancaria.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cuenta_bancaria }
      format.js
    end
  end

  # GET /cuentas_bancarias/1/edit
   def edit
    @cuenta_bancaria = CuentaBancaria.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cuenta_bancaria }
      format.js
    end
  end

  # POST /cuentas_bancarias
  # POST /cuentas_bancarias.json
  def create
    @cuenta_bancaria = CuentaBancaria.new(cuenta_bancaria_params)

    respond_to do |format|
      if @cuenta_bancaria.save
        format.html { redirect_to cuentas_bancarias_url, notice: 'Cuenta bancaria was successfully created.' }
        format.json { render :show, status: :created, location: @cuenta_bancaria }
        format.js
      else
        format.html { render :new }
        format.json { render json: @cuenta_bancaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuentas_bancarias/1
  # PATCH/PUT /cuentas_bancarias/1.json
  def update
    respond_to do |format|
      if @cuenta_bancaria.update(cuenta_bancaria_params)
        format.html { redirect_to cuentas_bancarias_url, notice: 'Cuenta bancaria was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuenta_bancaria }
      else
        format.html { render :edit }
        format.json { render json: @cuenta_bancaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuentas_bancarias/1
  # DELETE /cuentas_bancarias/1.json
  def destroy
    @cuenta_bancaria.destroy
    respond_to do |format|
      format.html { redirect_to cuentas_bancarias_url, notice: 'Cuenta bancaria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuenta_bancaria
      @cuenta_bancaria = CuentaBancaria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuenta_bancaria_params
      params.require(:cuenta_bancaria).permit(:banco_id, :numero_cuenta, :fecha_apertura, :saldo, :estado_id)
    end

    def render_cuenta_bancaria_list(cuenta_bancaria)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'cuentas_bancarias', 'show.tlf')

      cuenta_bancaria.each do |cuenta_bancaria|
        report.list.add_row do |row|
          row.values banco: cuenta_bancaria.banco.banco_sucursal,
                     numero_cuenta: cuenta_bancaria.numero_cuenta,
                     saldo: cuenta_bancaria.saldo,
                     fecha_apertura: cuenta_bancaria.fecha_apertura,
                     estado: cuenta_bancaria.estado.descripcion
          row.item(:banco).style(:color, 'red')
          row.item(:numero_cuenta).style(:color, 'red')
          row.item(:saldo).style(:color, 'red')
          row.item(:fecha_apertura).style(:color, 'red')
          row.item(:estado).style(:color, 'red')
        end
      end
    report.page.item(:logo).src = 'E:/Desarrollo/Ruby_on_rails/gestion/caja_banco/public/uploads/parametro/logo_empresa/3/logo.png'
      send_data report.generate, filename: 'cuentas_bancarias.pdf',
                                   type: 'application/pdf',
                                   disposition: 'attachment'
    end
end
