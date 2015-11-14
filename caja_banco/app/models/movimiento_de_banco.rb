class MovimientoDeBanco < ActiveRecord::Base
  belongs_to :tipo_de_movimiento
  belongs_to :banco

  has_many :movimientos_de_bancos_detalles

  validates :tipo_de_movimiento_id, presence: true
  validates :banco_id, presence: true
  validates :descripcion, presence: true
end
