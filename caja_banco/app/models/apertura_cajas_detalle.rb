class AperturaCajasDetalle < ActiveRecord::Base
  belongs_to :apertura_caja
  belongs_to :cheque_entrante
end
