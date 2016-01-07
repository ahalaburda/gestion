class BoletaDeDepositoDetalle < ActiveRecord::Base
  audited
  belongs_to :boleta_de_deposito
  belongs_to :cheque_entrante
end
