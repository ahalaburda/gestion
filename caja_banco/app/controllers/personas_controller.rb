class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  # GET /personas
  # GET /personas.json
  def index
    @persona = Persona.new
    @personas = Persona.all

    @user = User.new
    @caja = Caja.new
    @cheque_entrante = ChequeEntrante.new
    @firmante = Firmante.new
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @personas }
        format.pdf { render_persona_list(@personas) }
    end
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    @persona = Persona.new
    respond_to do |format|
      format.js
    end
  end

  # GET /personas/1/edit
  def edit
    @persona = Persona.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)
    respond_to do |format|
      if @persona.save
        format.html { redirect_to personas_url }
        format.json { render :show, status: :created, location: @persona }
        format.js
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to personas_url }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    respond_to do |format|
      if @persona.destroy
        format.html { redirect_to personas_url }
        format.json { head :no_content }
      else
          format.html { redirect_to personas_url, notice: 'No se puede eliminar.' }
          format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:tipo_de_persona_id, :nombre, :apellido, :telefono, :cedula_identidad, :pais_id, :departamento_id, :ciudad_id, :direccion, :fecha_de_nacimiento, :correo)
    end

    def render_persona_list(persona)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'personas', 'show.tlf')

      persona.each do |task|
        report.list.add_row do |row|
          row.values name: task.nombre,
                     apellido: task.apellido,
                     cedula: task.cedula_identidad,
                     direccion: task.direccion,
                     departamento: task.departamento.descripcion,
                     pais: task.pais.descripcion,
                     ciudad: task.ciudad.descripcion,
                     correo: task.correo,
                     telefono: task.telefono
          row.item(:name).style(:color, 'red')
          row.item(:apellido).style(:color, 'red')
          row.item(:cedula).style(:color, 'red')
          row.item(:direccion).style(:color, 'red')
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
      send_data report.generate, filename: 'personas.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end
