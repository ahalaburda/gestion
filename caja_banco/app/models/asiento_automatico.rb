class AsientoAutomatico < ActiveRecord::Base
	has_many :asientos_automaticos_detalles, dependent: :restrict_with_error
	accepts_nested_attributes_for :asientos_automaticos_detalles, allow_destroy: true
end
