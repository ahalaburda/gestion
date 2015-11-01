class ChequePropio < ActiveRecord::Base
  belongs_to :chequera

  validates :chequera_id,
	:presence => {
		message: 'Seleccione una chequera'}

	validates :numero_cheque,
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
end