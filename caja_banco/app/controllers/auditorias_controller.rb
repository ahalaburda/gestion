class AuditoriasController < ApplicationController


  # GET /auditorias
  # GET /auditorias.json
  def index
    @auditorias = Auditoria.all.order('id desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @auditorias }
      format.pdf { render_auditoria_list(@auditorias) }
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
    report.page.item(:logo).src = 'E:/Desarrollo/Ruby_on_rails/gestion/caja_banco/public/uploads/parametro/logo_empresa/3/logo.png'
       send_data report.generate, filename: 'log_de_auditoria.pdf',
                                  type: 'application/pdf',
                                  disposition: 'attachment'
     end
end
