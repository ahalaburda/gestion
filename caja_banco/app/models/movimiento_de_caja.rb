class MovimientoDeCaja < ActiveRecord::Base
  belongs_to :tipo_de_movimiento
  belongs_to :caja
  has_many :movimientos_de_cajas_detalles
  
  accepts_nested_attributes_for :movimientos_de_cajas_detalles, allow_destroy: true

  validates :tipo_de_movimiento_id, presence: true

  validates :caja_id, presence: true
  validates :descripcion, presence: true

   def set_estado_abierto
    caja = Caja.find(self.caja_id)
    caja.estado_id = 1
    caja.save
  end

  before_create :bc_movimiento
  # after_create :ac_movimiento


  def bc_movimiento
    self.fecha = Time.now
  
  end

  #   def ac_movimiento
  #     saldo_efectivo = self.apertura_caja.saldo_final_efectivo
  #     saldo_cheque = self.apertura_caja.saldo_final_cheque
  #     if self.es_ingreso 
  #       saldo_efectivo = saldo_efectivo + self.monto_efectivo
  #       saldo_cheque = saldo_cheque + self.monto_cheque
  #     else
  #       saldo_efectivo = saldo_efectivo - self.monto_efectivo
  #       saldo_cheque = saldo_cheque - self.monto_cheque
  #     end
  #     AperturaCaja.update(self.apertura_caja_id, saldo_final_efectivo: saldo_efectivo)
  #     AperturaCaja.update(self.apertura_caja_id, saldo_final_cheque: saldo_cheque)
    # end
end
