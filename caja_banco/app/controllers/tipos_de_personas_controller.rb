class TiposDePersonasController < ApplicationController
  before_action :set_tipo_de_persona, only: [:show, :edit, :update, :destroy]

  # GET /tipos_de_personas
  # GET /tipos_de_personas.json
  def index
    @tipos_de_personas = TipoDePersona.all
    @tipo_de_persona = TipoDePersona.new

    @persona = Persona.new
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tipos_de_personas }
        format.pdf { render_tipos_de_personas_list(@tipos_de_personas) }
      end
  end

  # GET /tipos_de_personas/1
  # GET /tipos_de_personas/1.json
  def show
  end

  # GET /tipos_de_personas/new
  def new
    @tipo_de_persona = TipoDePersona.new
  end

  # GET /tipos_de_personas/1/edit
  def edit
  end

  # POST /tipos_de_personas
  # POST /tipos_de_personas.json
  def create
    @tipo_de_persona = TipoDePersona.new(tipo_de_persona_params)

    respond_to do |format|
      if @tipo_de_persona.save
        format.html { redirect_to tipos_de_personas_url, notice: 'Tipo de persona was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_de_persona }
      else
        format.html { render :new }
        format.json { render json: @tipo_de_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos_de_personas/1
  # PATCH/PUT /tipos_de_personas/1.json
  def update
    respond_to do |format|
      if @tipo_de_persona.update(tipo_de_persona_params)
        format.html { redirect_to tipos_de_personas_url, notice: 'Tipo de persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_de_persona }
      else
        format.html { render :edit }
        format.json { render json: @tipo_de_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_personas/1
  # DELETE /tipos_de_personas/1.json
  def destroy
    @tipo_de_persona.destroy
    respond_to do |format|
      format.html { redirect_to tipos_de_personas_url, notice: 'Tipo de persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_de_persona
      @tipo_de_persona = TipoDePersona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_de_persona_params
      params.require(:tipo_de_persona).permit(:descripcion)
    end

    def render_tipos_de_personas_list(tipo_de_persona)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'tipos_de_personas', 'show.tlf')

      tipo_de_persona.each do |task|
        report.list.add_row do |row|
          row.values descripcion: task.descripcion
          row.item(:descripcion).style(:color, 'red')
        end
      end
    report.page.item(:logo).src = File.join(Rails.root, 'public','uploads', 'parametro', 'logo_empresa', '3', 'logo.png')
    report.page.item(:elaboracion).value(current_user.username)
    report.page.item(:fecha_elaboracion).value(Time.current.to_s)
      send_data report.generate, filename: 'tipos de personas.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end
end
