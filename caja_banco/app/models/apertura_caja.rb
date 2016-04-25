class AperturaCaja < ActiveRecord::Base
  audited
  belongs_to :caja
  belongs_to :persona
  has_many :apertura_cajas_detalles, dependent: :restrict_with_error
  accepts_nested_attributes_for :apertura_cajas_detalles, allow_destroy: true

  after_create :set_estado_abierto
  before_create :set_saldos
  before_create :set_hora_de_apertura
  # after_update :set_estado_cerrado
  after_create :ac_movimiento_de_caja_saldo_inicial
  after_create :ac_movimiento_de_caja_detalle
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
  def ac_movimiento_de_caja_saldo_inicial
    total = self.saldo_inicial_efectivo.to_f + self.saldo_inicial_cheque.to_f
    @movimiento_de_caja = MovimientoDeCaja.new({
      :tipo_de_movimiento_id => 1,
      :caja_id => self.caja_id,
      :descripcion => "Saldo Inicial",
      :fecha => self.apertura,
      :total =>  total,
      :monto_total_efectivo =>  self.saldo_inicial_efectivo,
      :monto_total_cheque =>  self.saldo_inicial_cheque,
      :apertura_id => self.id
    });
    @movimiento_de_caja.save();
  end
  def ac_movimiento_de_caja_detalle
    mov = MovimientoDeCaja.last;
    @apertura_caja_detalles = AperturaCajasDetalle.all
    @apertura_caja_detalles.each do |aperturaDetalle|
      if aperturaDetalle.apertura_caja_id == self.id
        @movimiento_de_caja_detalle = MovimientoDeCajaDetalle.new({
          :movimiento_de_caja_id =>mov.id ,
          :cheque_entrante_id => aperturaDetalle.cheque_entrante_id,
          :monto_cheque => aperturaDetalle.monto
          });
        @movimiento_de_caja_detalle.save();
      end
    end
  end
end