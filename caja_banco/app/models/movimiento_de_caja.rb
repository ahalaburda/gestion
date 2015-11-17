class MovimientoDeCaja < ActiveRecord::Base
  belongs_to :tipo_de_movimiento
  belongs_to :caja
  has_many :movimientos_de_cajas_detalles

  validates :tipo_de_movimiento_id, presence: true
  validates :caja_id, presence: true
  validates :descripcion, presence: true
end
