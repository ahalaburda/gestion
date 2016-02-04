class AsientoAutomaticoDetalle < ActiveRecord::Base
  belongs_to :asiento_automatico
  belongs_to :cuenta
end
