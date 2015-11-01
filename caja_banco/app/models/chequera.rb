class Chequera < ActiveRecord::Base
  belongs_to :cuenta_bancaria
  belongs_to :estado

  	validates :cuenta_bancaria_id,
				:presence => {
					message: 'Debe seleccionar una cuenta bancaria'}
 	
 	validates :estado_id,
				:presence => {
					message: 'Debe seleccionar un estado'}

	validates :numero_cheque_inicial,
		:presence => {
			message: 'Este campo es requerido'},
		:format => {
					with: /\A[0-9]+\z/,
					message: 'solo permite numeros'}

	validates :numero_cheque_final,
		:presence => {
			message: 'Este campo es requerido'},
		:format => {
					with: /\A[0-9]+\z/,
					message: 'solo permite numeros'}
end
