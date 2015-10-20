class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  # GET /personas
  # GET /personas.json
  def index
    @persona = Persona.new
    @personas = Persona.all
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @personas }
        format.xls { send_data @personas.to_xls(
          :columns => [ :nombre, :apellido, :telefono, :cedula_identidad, :pais_id, :departamento_id, :ciudad_id, :direccion, :fecha_de_nacimiento, :correo, :created_at, :updated_at],
          :headers => [ "Nombre", "Apellido", "Telefono","Cedula de Identidad", "Pais", "Departamento", "Ciudad", "Direccion","fecha de nacimiento", "Correo", "Fecha de Creacion", "Fecha de actualizacion"] ),
          :filename => 'personas.xls' }
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
        format.html { redirect_to personas_url, notice: 'Persona was successfully created.' }
        format.json { render :show, status: :created, location: @persona }
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
        format.html { redirect_to personas_url, notice: 'Persona was successfully updated.' }
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
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
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
          row.values no: task.id, 
                     name: task.nombre,
                     apellido: task.apellido,
                     cedula: task.cedula_identidad,
                     direccion: task.direccion,
                     departamento: task.departamento_id,
                     pais: task.pais_id,
                     ciudad: task.ciudad_id,
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
      
      send_data report.generate, filename: 'personas.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
