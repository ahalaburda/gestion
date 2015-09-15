class TipoDeMovimiento < ActiveRecord::Base


	validates :descripcion,
			:presence => {
				message: 'este campo es requerido'},

			:length => { 
				:maximum => 20,
				:too_long => 'debe tener como maximo %{count} caracteres'}
end
