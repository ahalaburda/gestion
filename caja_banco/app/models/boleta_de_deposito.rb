class BoletaDeDeposito < ActiveRecord::Base
  audited
  belongs_to :banco
  belongs_to :persona
  belongs_to :cuenta_bancaria
  belongs_to :caja
  has_many :boletas_de_depositos_detalles, dependent: :restrict_with_error
  accepts_nested_attributes_for :boletas_de_depositos_detalles, allow_destroy: true

  validates :banco_id, presence: true
  validates :numero, presence: true, numericality: true, length: {maximum: 30}
  validates :persona_id, presence: true
  validates :cuenta_bancaria_id, presence: true
  validates :caja_id, presence: true
  validates :fecha, presence: true

  after_create :movimiento_de_banco
  after_create :movimiento_de_banco_detalle
  after_create :movimiento_de_caja
  after_create :movimiento_de_caja_detalle

  def movimiento_de_banco
    @movimiento_de_banco = MovimientoDeBanco.new({
        :tipo_de_movimiento_id => 1,
      :banco_id => 1,
      :descripcion => "Segun boleta de deposito nº #{self.numero}" ,
      :fecha => Time.zone.now,
      :total => self.total
    });
    @movimiento_de_banco.save();
  end
  def movimiento_de_banco_detalle
    mov = MovimientoDeBanco.last;
    @movimiento_de_banco_detalle = MovimientoDeBancoDetalle.new({
      :movimiento_de_banco_id => mov.id,
      :cuenta_bancaria_id => self.cuenta_bancaria_id,
      :monto => self.total
    });
    @movimiento_de_banco_detalle.save();
  end
  def movimiento_de_caja
    @apertura = AperturaCaja.all.order("id ASC");
    @apertura.each do |a|
      if a.caja_id == self.caja_id
        @movimiento_de_caja = MovimientoDeCaja.new({
          :tipo_de_movimiento_id => 2,
          :caja_id => self.caja_id,
          :descripcion => "Segun boleta de deposito nº #{self.numero}" ,
          :fecha => Time.zone.now,
          :total => self.total,
          :monto_total_efectivo => self.monto_total_efectivo,
          :monto_total_cheque => self.monto_total_cheque,
          :apertura_id => a.id
          });
      end
    end
     @movimiento_de_caja.save();
  end
  def movimiento_de_caja_detalle
    mov = MovimientoDeCaja.last;
    @boletas_de_depositos_detalles = BoletaDeDepositoDetalle.all
    @boletas_de_depositos_detalles.each do |bodd|
      if bodd.boleta_de_deposito_id == self.id
        @movimiento_de_caja_detalle = MovimientoDeCajaDetalle.new({
          :movimiento_de_caja_id =>mov.id ,
          :cheque_entrante_id => bodd.cheque_entrante_id,
          :monto_efectivo => bodd.monto_efectivo,
          :monto_cheque => bodd.monto_cheque
          });
        @movimiento_de_caja_detalle.save();
      end
    end
  end
end