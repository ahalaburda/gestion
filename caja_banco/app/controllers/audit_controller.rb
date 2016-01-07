class AuditController < ApplicationController
  def index
    @audits = Audit.all.order('id desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audits }
      format.pdf { render_audit_list(@audits) }
    end
  end

  def render_audit_list(audit)
     report = ThinReports::Report.new layout: File.join(Rails.root, 'app','views', 'audit', 'show.tlf')

     audit.each do |task|
       report.list.add_row do |row|
         row.values tabla_modificada: task.auditable_type,
                    operacion: task.action,
                    cambio_auditado: task.audited_changes,
                    nombre_usuario: User.find(task.user_id).username
         row.item(:tabla_modificada).style(:color, 'red')
         row.item(:operacion).style(:color, 'red')
         row.item(:cambio_auditado).style(:color, 'red')
         row.item(:nombre_usuario).style(:color, 'red')
       end
     end
  report.page.item(:logo).src = File.join(Rails.root, 'public','uploads', 'parametro', 'logo_empresa', '3', 'logo.png')
  report.page.item(:elaboracion).value(current_user.username)
  report.page.item(:fecha_elaboracion).value(Time.current.to_s)
     send_data report.generate, filename: 'log_de_auditoria.pdf',
                                type: 'application/pdf',
                                disposition: 'attachment'
   end
end
