class DepartamentosController < ApplicationController
  before_action :set_departamento, only: [:show, :edit, :update, :destroy]

  # GET /departamentos
  # GET /departamentos.json
  def index
    @departamento = Departamento.new
    @departamentos = Departamento.all

    @pais= Pais.new
    @persona = Persona.new
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @departamentos }
        format.pdf { render_departamento_list(@departamentos) }
    end
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
    @departamento = Departamento.new(departamento_params)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departamento }
    end
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departamento }
      format.js
    end
  end

  # GET /departamentos/1/edit
  def edit
    @departamento = Departamento.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @departamento = Departamento.new(departamento_params)
    respond_to do |format|
      if @departamento.save
        format.html { redirect_to departamentos_url, notice: 'Departamento was successfully created.' }
        format.json { render :show, status: :created, location: @departamento }
        format.js
      else
        format.html { render :new }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1
  # PATCH/PUT /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to departamentos_url, notice: 'Departamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento.destroy
    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: 'Departamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departamento_params
      params.require(:departamento).permit(:descripcion, :pais_id)
    end
    def render_departamento_list(departamento)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'departamentos', 'show.tlf')

      departamento.each do |task|
        report.list.add_row do |row|
          row.values no: task.id,
                     name: task.descripcion,
                     pais: task.pais_id
          row.item(:name).style(:color, 'red')
          row.item(:pais).style(:color, 'red')
        end
      end
      send_data report.generate, filename: 'departamentos.pdf',
                                   type: 'application/pdf',
                                   disposition: 'attachment'
      end
end