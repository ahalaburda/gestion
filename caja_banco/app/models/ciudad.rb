class Ciudad < ActiveRecord::Base
  belongs_to :departamento

  validates :descripcion,
			:presence => {
				message: 'Este campo es requerido'},
			:length => { 
				:maximum => 20,
				:too_long => 'debe tener como maximo %{count} caracteres'},
			:format => {
				with: /\A[a-zA-Z]+\z/,
				message: 'Solo permite letras'}

		validates :departamento_id,
		:presence => {
			message: 'Debe seleccionar un Departamento'}
end
