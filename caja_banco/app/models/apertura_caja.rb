class AperturaCaja < ActiveRecord::Base
  belongs_to :caja
  belongs_to :persona
  belongs_to :caja

  after_create :set_estado_abierto
  before_create :set_saldos
  before_create :set_hora_apertura

  def set_estado_abierto
  	caja = Caja.find(self.caja_id)
  	caja.estado_id = 1
  	caja.save
  end
  def set_saldos
		self.saldo_final_cheque = self.saldo_inicial_cheque
		self.saldo_final_efectivo = self.saldo_inicial_efectivo
  end
  def set_hora_apertura
  	self.apertura = Time.now
  end

end
