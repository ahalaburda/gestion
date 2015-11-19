class TipoDeMovimiento < ActiveRecord::Base
	has_many :movimientos_de_cajas
	has_many :movimientos_de_bancos


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
				message: 'Este tipo de movimiento ya existe'
			}
end
