class BoletaDeDeposito < ActiveRecord::Base
  belongs_to :banco
  belongs_to :persona
  belongs_to :cuenta_bancaria
  belongs_to :caja
  has_many :boletas_de_depositos_detalles

  validates :banco_id, presence: true
  validates :numero, presence: true
  validates :persona_id, presence: true
  validates :cuenta_bancaria_id, presence: true
  validates :caja_id, presence: true
  validates :fecha, presence: true
end
