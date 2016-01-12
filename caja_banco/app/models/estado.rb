class Estado < ActiveRecord::Base
	audited
	has_many :cajas
	has_many :chequeras
	has_many :cuentas_bancarias
	has_many :parametros

	validates :descripcion,
		:presence => {
			message: 'Este campo es requerido'},
		:length => {
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},
		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'Solo permite letras'}
end
