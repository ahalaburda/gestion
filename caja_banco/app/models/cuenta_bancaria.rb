class CuentaBancaria < ActiveRecord::Base
  belongs_to :banco
  belongs_to :estado

  	validates :banco_id,
				:presence => {
					message: 'Debe seleccionar un banco'}

	validates :numero_cuenta,
				:presence => {
					message: 'Este campo es requerido'},
				:format => {
					with: /\A[0-9]+\z/,
					message: 'solo permite numeros'}

	validates :estado_id,
				:presence => {
					message: 'Debe seleccionar un estado'}
					
end