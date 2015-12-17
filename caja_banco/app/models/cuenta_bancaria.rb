class CuentaBancaria < ActiveRecord::Base
  belongs_to :banco
  belongs_to :estado
  has_many :chequeras
  has_many :movimientos_de_bancos_detalles
  has_many :boletas_de_depositos
  has_many :firmantes

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

end
