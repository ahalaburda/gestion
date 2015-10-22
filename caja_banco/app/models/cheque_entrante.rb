class ChequeEntrante < ActiveRecord::Base
  belongs_to :banco
  belongs_to :persona

  	validates :banco_id,
	:presence => {
		message: 'Seleccione un banco'}

	validates :numero,
		:presence => {
			message: 'Este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :monto,
		:presence => {
			message: 'Este campo es requerido'}

	validates :concepto,
		:presence => {
			message: 'Este campo es requerido'},
		:length => { 
			:maximum => 50,
			:too_long => 'Debe tener como maximo %{count} caracteres'}
		
	validates :persona_id,
	:presence => {
		message: 'Seleccione una persona'}
end
