class CiudadesController < ApplicationController
  before_action :set_ciudad, only: [:show, :edit, :update, :destroy]

  # GET /ciudades
  # GET /ciudades.json
  def index
    @ciudad = Ciudad.new
    @ciudades = Ciudad.all
    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @ciudades }
        format.xls { send_data @ciudades.to_xls(
          :columns => [:descripcion, :codigo_postal, :departamento_id, :created_at, :updated_at],
          :headers => ["Ciudad", "Codigo Postal", "departamento", "Fecha de Creacion", "Fecha de actualizacion"] ),
          :filename => 'Ciudades.xls' }
        format.pdf { render_ciudad_list(@ciudades) }
    end
  end

  # GET /ciudades/1
  # GET /ciudades/1.json
  def show
  end

  # GET /ciudades/new
  def new
    @ciudad = Ciudad.new
  end

  # GET /ciudades/1/edit
  def edit
  end

  # POST /ciudades
  # POST /ciudades.json
  def create
    @ciudad = Ciudad.new(ciudad_params)

    respond_to do |format|
      if @ciudad.save
        format.html { redirect_to ciudades_url, notice: 'Ciudad was successfully created.' }
        format.json { render :show, status: :created, location: @ciudad }
      else
        format.html { render :new }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciudades/1
  # PATCH/PUT /ciudades/1.json
  def update
    respond_to do |format|
      if @ciudad.update(ciudad_params)
        format.html { redirect_to ciudades_url, notice: 'Ciudad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ciudad }
      else
        format.html { render :edit }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudades/1
  # DELETE /ciudades/1.json
  def destroy
    @ciudad.destroy
    respond_to do |format|
      format.html { redirect_to ciudades_url, notice: 'Ciudad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciudad
      @ciudad = Ciudad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciudad_params
      params.require(:ciudad).permit(:descripcion, :codigo_postal, :departamento_id)
    end

    def render_ciudad_list(ciudad)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'ciudades', 'show.tlf')

      ciudad.each do |task|
        report.list.add_row do |row|
          row.values no: task.id, 
                     name: task.descripcion,
                     codigo_postal: task.codigo_postal,
                     departamento: task.departamento_id
          row.item(:name).style(:color, 'red')
          row.item(:codigo_postal).style(:color, 'red')
          row.item(:departamento).style(:color, 'red')
        end
      end 
      send_data report.generate, filename: 'ciudades.pdf', 
                                   type: 'application/pdf', 
                                   disposition: 'attachment'
    end
end
