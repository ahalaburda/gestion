class BoletaDeDepositoDetalle < ActiveRecord::Base
  belongs_to :boleta_de_deposito
  belongs_to :cheque_entrante
end
