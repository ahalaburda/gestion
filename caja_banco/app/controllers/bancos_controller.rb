class BancosController < ApplicationController
  before_action :set_banco, only: [:show, :edit, :update, :destroy]

  # GET /bancos
  # GET /bancos.json
  def index
    @banco = Banco.new
    @bancos = Banco.all

    @pais = Pais.new
    @departamento = Departamento.new
    @ciudad = Ciudad.new
    @cuenta_bancaria = CuentaBancaria.new
    @cheque_entrante = ChequeEntrante.new

    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @bancos }
        format.pdf { render_banco_list(@bancos) }
    end
  end

  # GET /bancos/1
  # GET /bancos/1.json
  def show
    @banco = Banco.find(params[:id])
  end

  # GET /bancos/new
  def new
    @banco = Banco.new
    respond_to do |format|
      format.js
    end
  end

  # GET /bancos/1/edit
  def edit
    @banco = Banco.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /bancos
  # POST /bancos.json
  def create
    @banco = Banco.new(banco_params)

    respond_to do |format|
      if @banco.save
        format.html { redirect_to bancos_url, notice: 'Banco was successfully created.' }
        format.json { render :show, status: :created, location: @banco }
        format.js
      else
        format.html { render :new }
        format.json { render json: @banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bancos/1
  # PATCH/PUT /bancos/1.json
  def update
    respond_to do |format|
      if @banco.update(banco_params)
        format.html { redirect_to bancos_url, notice: 'Actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @banco }
      else
        format.html { render :edit }
        format.json { render json: @banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bancos/1
  # DELETE /bancos/1.json
  def destroy
    @banco.destroy
    respond_to do |format|
      format.html { redirect_to bancos_url, notice: 'Banco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco
      @banco = Banco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banco_params
      params.require(:banco).permit(:nombre, :direccion, :telefono, :sucursal, :pais_id, :departamento_id, :ciudad_id, :correo)
    end

    def render_banco_list(banco)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'bancos', 'show.tlf')

      banco.each do |task|
        report.list.add_row do |row|
          row.values name: task.banco_sucursal,
                     direccion: task.direccion,
                     sucursal: task.sucursal,
                     departamento: task.departamento.descripcion,
                     pais: task.pais.descripcion,
                     ciudad: task.ciudad.descripcion,
                     correo: task.correo,
                     telefono: task.telefono
          row.item(:name).style(:color, 'red')
          row.item(:direccion).style(:color, 'red')
          row.item(:sucursal).style(:color, 'red')
          row.item(:departamento).style(:color, 'red')
          row.item(:pais).style(:color, 'red')
          row.item(:ciudad).style(:color, 'red')
          row.item(:correo).style(:color, 'red')
          row.item(:telefono).style(:color, 'red')
        end
      end
    report.page.item(:logo).src = File.join(Rails.root, 'public','uploads', 'parametro', 'logo_empresa', '3', 'logo.png')
    report.page.item(:elaboracion).value(current_user.username)
    report.page.item(:fecha_elaboracion).value(Time.current.to_s)
      send_data report.generate, filename: 'bancos.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end
