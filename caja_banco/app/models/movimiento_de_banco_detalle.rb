class MovimientoDeBancoDetalle < ActiveRecord::Base
  belongs_to :movimiento_de_banco
  belongs_to :cuenta_bancaria

  validates :cuenta_bancaria_id, presence: true
  validates :monto, presence: true
end
