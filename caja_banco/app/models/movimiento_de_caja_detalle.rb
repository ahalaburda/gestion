class MovimientoDeCajaDetalle < ActiveRecord::Base
  audited
  belongs_to :movimiento_de_caja
  belongs_to :cheque_entrante
  belongs_to :cheque_propio
end

# before_create :bc_movimiento_detalle

# def bc_movimiento_detalle

# end