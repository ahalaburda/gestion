class MovimientoDeBanco < ActiveRecord::Base
  audited
  belongs_to :tipo_de_movimiento
  belongs_to :banco
  has_many :movimientos_de_bancos_detalles, dependent: :restrict_with_error
  accepts_nested_attributes_for :movimientos_de_bancos_detalles, allow_destroy: true

  validates :tipo_de_movimiento_id, presence: true
  validates :fecha, presence: true
  validates :banco_id, presence: true
  validates :descripcion, presence: true, length: { maximum: 50}
end
