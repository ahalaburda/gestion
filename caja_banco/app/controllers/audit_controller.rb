class AuditController < ApplicationController
  def index
    @audits = Audit.all.order('id desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audits }
      format.pdf { render_auditoria_list(@audits) }
    end
  end
end
