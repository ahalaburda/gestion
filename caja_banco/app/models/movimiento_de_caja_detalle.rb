class MovimientoDeCajaDetalle < ActiveRecord::Base
  belongs_to :movimiento_de_caja
  belongs_to :cheque_entrante
  belongs_to :cheque_propio
end
