class MovimientoDeBancoDetalle < ActiveRecord::Base
  belongs_to :movimiento_de_banco
  belongs_to :cuenta_bancaria
end
