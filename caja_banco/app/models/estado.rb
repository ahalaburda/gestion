class Estado < ActiveRecord::Base
	audited
	has_many :cajas
	has_many :chequeras
	has_many :cuentas_bancarias
	has_many :parametros
	has_many :cheques_entrantes

	validates :descripcion,
		:presence => {
			message: 'Este campo es requerido'},
		:length => {
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},
		:numericality => false
end