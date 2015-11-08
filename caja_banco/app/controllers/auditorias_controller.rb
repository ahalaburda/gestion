class AuditoriasController < ApplicationController
  before_action :set_auditoria, only: [:show, :edit, :update, :destroy]

  # GET /auditorias
  # GET /auditorias.json
  def index
    @auditorias = Auditoria.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @auditorias }
      format.xls { send_data @auditorias.to_xls(
        :columns => [:nombre_tabla, :operacion, :valor_anterior, :valor_nuevo, :nombre_usuario ],
        :headers => ["Registro modificado", "Operacion", "Valor anterior", "Valor nuevo", "Nombre de usuario" ] ),
        :filename => 'log_de_auditoria.xls' }
       format.pdf { render_auditoria_list(@auditorias) }
    end
  end

  # GET /auditorias/1
  # GET /auditorias/1.json
  def show
  end

  # GET /auditorias/new
  def new
    @auditoria = Auditoria.new
  end

  # GET /auditorias/1/edit
  def edit
  end

  # POST /auditorias
  # POST /auditorias.json
  def create
    @auditoria = Auditoria.new(auditoria_params)

    respond_to do |format|
      if @auditoria.save
        format.html { redirect_to @auditoria, notice: 'Auditoria was successfully created.' }
        format.json { render :show, status: :created, location: @auditoria }
      else
        format.html { render :new }
        format.json { render json: @auditoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auditorias/1
  # PATCH/PUT /auditorias/1.json
  def update
    respond_to do |format|
      if @auditoria.update(auditoria_params)
        format.html { redirect_to @auditoria, notice: 'Auditoria was successfully updated.' }
        format.json { render :show, status: :ok, location: @auditoria }
      else
        format.html { render :edit }
        format.json { render json: @auditoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auditorias/1
  # DELETE /auditorias/1.json
  def destroy
    @auditoria.destroy
    respond_to do |format|
      format.html { redirect_to auditorias_url, notice: 'Auditoria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auditoria
      @auditoria = Auditoria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auditoria_params
      params.require(:auditoria).permit(:nombre_tabla, :operacion, :valor_anterior, :valor_nuevo, :nombre_usuario)
    end

    def render_auditoria_list(auditorias)
       report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'auditorias', 'show.tlf')

       auditorias.each do |task|
         report.list.add_row do |row|
           row.values tabla_modificada: task.nombre_tabla,
                      operacion: task.operacion,
                      valor_anterior: task.valor_anterior,
                      valor_nuevo: task.valor_nuevo,
                      nombre_usuario: task.nombre_usuario
           row.item(:tabla_modificada).style(:color, 'red')
           row.item(:operacion).style(:color, 'red')
           row.item(:valor_anterior).style(:color, 'red')
           row.item(:valor_nuevo).style(:color, 'red')
           row.item(:nombre_usuario).style(:color, 'red')
         end
       end

       send_data report.generate, filename: 'log_de_auditoria.pdf',
                                  type: 'application/pdf',
                                  disposition: 'attachment'
     end
end
