class CuentaBancaria < ActiveRecord::Base
  audited
  belongs_to :banco
  belongs_to :estado
  has_many :chequeras, dependent: :restrict_with_error
  has_many :movimientos_de_bancos_detalles, dependent: :restrict_with_error
  has_many :boletas_de_depositos, dependent: :restrict_with_error
  has_many :firmantes, dependent: :restrict_with_error

	validates :banco_id,
				:presence => {
					message: 'Debe seleccionar un banco'}

	validates :numero_cuenta,
				:presence => {
					message: 'Este campo es requerido'},
				:numericality => true,
				:length => { maximum: 30  }

	validates :estado_id,
				:presence => {
					message: 'Debe seleccionar un estado'}

  validates :fecha_apertura,
				:presence => {
					message: 'Este campo es requerido'}

	def cuenta
		"#{banco.nombre} - #{numero_cuenta}"
	end
end