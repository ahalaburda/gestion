class AsientoAutomatico < ActiveRecord::Base
	has_many :asientos_automaticos_detalles
	accepts_nested_attributes_for :asientos_automaticos_detalles, allow_destroy: true
end
