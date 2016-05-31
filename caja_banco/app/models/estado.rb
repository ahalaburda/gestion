class Estado < ActiveRecord::Base
	audited
	has_many :cajas, dependent: :restrict_with_error
	has_many :chequeras, dependent: :restrict_with_error
	has_many :cuentas_bancarias, dependent: :restrict_with_error
	has_many :parametros, dependent: :restrict_with_error
	has_many :cheques_entrantes, dependent: :restrict_with_error

	validates :descripcion,
		:presence => {
			message: 'Este campo es requerido'},
		:length => {
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},
		:numericality => false
end