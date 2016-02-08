class Cuenta < ActiveRecord::Base
	has_many :asientos_automaticos_detalles

	def cuenta_contable
		"#{numero_cuenta_contable} - #{descripcion}"
	end
end
