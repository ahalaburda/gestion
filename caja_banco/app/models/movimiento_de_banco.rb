class MovimientoDeBanco < ActiveRecord::Base
  belongs_to :tipo_de_movimiento
  belongs_to :banco
  has_many :movimientos_de_bancos_detalles
  accepts_nested_attributes_for :movimientos_de_bancos_detalles, allow_destroy: true

  validates :tipo_de_movimiento_id, presence: true
  validates :fecha, presence: true
  validates :banco_id, presence: true
  validates :descripcion, presence: true, length: { maximum: 50}, format: {with: /\A[a-zA-Z]+\z/,  message: 'Solo permite letras'}
end
