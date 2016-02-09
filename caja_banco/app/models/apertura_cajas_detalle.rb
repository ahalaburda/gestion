class AperturaCajasDetalle < ActiveRecord::Base
audited
  belongs_to :apertura_caja
  belongs_to :cheque_entrante
end
