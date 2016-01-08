class AperturaCaja < ActiveRecord::Base
  audited
  belongs_to :caja
  belongs_to :persona

  after_create :set_estado_abierto
  before_create :set_saldos
  before_create :set_hora_de_apertura
  after_update :set_estado_cerrado
  after_update :set_hora_de_cierre

  def set_estado_abierto
    caja = Caja.find(self.caja_id)
    caja.estado_id = 1
    caja.save
  end

  def set_estado_cerrado
    caja = Caja.find(self.caja_id)
    caja.estado_id = 2
    caja.save
  end

  def set_saldos
    self.saldo_final_cheque = self.saldo_inicial_cheque
    self.saldo_final_efectivo = self.saldo_inicial_efectivo
  end

  def set_hora_de_apertura
    self.apertura = Time.zone.now
  end
  def set_hora_de_cierre
    self.cierre = Time.zone.now
  end

end
