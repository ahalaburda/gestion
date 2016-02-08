class MovimientoDeCaja < ActiveRecord::Base
  audited
  belongs_to :tipo_de_movimiento
  belongs_to :caja
  has_many :movimientos_de_cajas_detalles

  accepts_nested_attributes_for :movimientos_de_cajas_detalles, allow_destroy: true

  validates :tipo_de_movimiento_id, presence: true
  validates :caja_id, presence: true
  validates :descripcion, presence: true, length: {maximum: 50}

  # def set_estado_abierto
  #   caja = Caja.find(self.caja_id)
  #   caja.estado_id = 1
  #   caja.save
  # end

  before_create :bc_movimiento
  # after_create :ac_movimiento

  def bc_movimiento
    self.fecha = Time.now
  end

  def ac_movimiento
    apertura_caja = AperturaCaja.find(self.apertura_id)

    saldo_cheque = apertura_caja.saldo_final_cheque.to_f
    saldo_efectivo = apertura_caja.saldo_final_efectivo.to_f

    if self.tipo_de_movimiento_id == 1
      saldo_cheque = saldo_cheque + self.monto_total_cheque.to_f
    else
      saldo_cheque = saldo_cheque - self.monto_total_cheque.to_f
    end
      saldo_efectivo = saldo_efectivo + self.monto_total_efectivo.to_f
      AperturaCaja.update(self.apertura_id, saldo_final_efectivo: saldo_efectivo)
      AperturaCaja.update(self.apertura_id, saldo_final_cheque: saldo_cheque)
  end
end