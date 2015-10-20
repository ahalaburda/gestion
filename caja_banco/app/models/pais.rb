class Pais < ActiveRecord::Base
	has_many :departamentos

		validates :descripcion,
			:presence => {
				message: 'Este campo es requerido'},

			:length => { 
				:maximum => 20,
				:too_long => 'debe tener como maximo %{count} caracteres'},

			:format => {
				with: /\A[a-zA-Z]+\z/,
				message: 'Solo permite letras'},

			:uniqueness => {
				message: 'Este pais ya existe'
			}
end
