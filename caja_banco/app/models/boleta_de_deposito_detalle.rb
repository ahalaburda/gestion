class BoletaDeDepositoDetalle < ActiveRecord::Base
	audited
	belongs_to :boleta_de_deposito
	belongs_to :cheque_entrante

validates :monto_cheque, :numericality => true
validates :monto_efectivo, :numericality => true
end