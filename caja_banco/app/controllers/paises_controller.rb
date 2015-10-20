class PaisesController < ApplicationController
  before_action :set_pais, only: [:show, :edit, :update, :destroy]

  # GET /paises
  # GET /paises.json
  def index
    @paises = Pais.all
    @pais = Pais.new
     respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @paises }
        format.xls { send_data @paises.to_xls(
          :columns => [ :descripcion, :created_at, :updated_at],
          :headers => ["Nombre", "Fecha de Creacion", "Fecha de actualizacion"] ),
          :filename => 'pais.xls' }
        format.pdf { render_pais_list(@paises) }
    end
  end

  # GET /paises/1
  # GET /paises/1.json
  def show
  end

  # GET /paises/new
  def new
    @pais = Pais.new
  end

  # GET /paises/1/edit
  def edit
  end

  # POST /paises
  # POST /paises.json
  def create
    @pais = Pais.new(pais_params)

    respond_to do |format|
      if @pais.save
        format.html { redirect_to paises_url, notice: 'Pais was successfully created.' }
        format.json { render :show, status: :created, location: @pais }
      else
        format.html { render :new }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paises/1
  # PATCH/PUT /paises/1.json
  def update
    respond_to do |format|
      if @pais.update(pais_params)
        format.html { redirect_to paises_url, notice: 'Pais was successfully updated.' }
        format.json { render :show, status: :ok, location: @pais }
      else
        format.html { render :edit }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paises/1
  # DELETE /paises/1.json
  def destroy
    @pais.destroy
    respond_to do |format|
      format.html { redirect_to paises_url, notice: 'Pais was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pais
      @pais = Pais.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pais_params
      params.require(:pais).permit(:descripcion)
    end
    def render_pais_list(pais)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'paises', 'show.tlf')

      pais.each do |task|
        report.list.add_row do |row|
          row.values no: task.id, 
                     name: task.descripcion
          row.item(:name).style(:color, 'red')
        end
      end 
      send_data report.generate, filename: 'paises.pdf', 
                                   type: 'application/pdf', 
                                   disposition: 'attachment'
      end
end