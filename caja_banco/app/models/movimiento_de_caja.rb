class MovimientoDeCaja < ActiveRecord::Base
  belongs_to :tipo_de_movimiento
  belongs_to :caja
  has_many :movimientos_de_cajas_detalles
  
  accepts_nested_attributes_for :movimientos_de_cajas_detalles, allow_destroy: true

  validates :tipo_de_movimiento_id, presence: true
  validates :fecha, presence: true
  validates :caja_id, presence: true
  validates :descripcion, presence: true

   def set_estado_abierto
    caja = Caja.find(self.caja_id)
    caja.estado_id = 1
    caja.save
  end
end
