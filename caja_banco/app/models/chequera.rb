class Chequera < ActiveRecord::Base
  audited
  belongs_to :cuenta_bancaria
  belongs_to :estado
  has_many :cheques_propios

	validates :cuenta_bancaria_id,
		:presence => {
			message: 'Debe seleccionar una cuenta bancaria'}

	validates :estado_id,
		:presence => {
			message: 'Debe seleccionar un estado'}

	validates :numero_cheque_inicial,
		:presence => {
			message: 'Este campo es requerido'},
		:numericality => true,
		:length => {maximum: 30}

	validates :numero_cheque_final,
		:presence => {
			message: 'Este campo es requerido'},
		:numericality => true,
		:length => {maximum: 30}
	
	def nombre
		banco = Banco.find(cuenta_bancaria.banco_id)
		"#{banco.nombre} - #{cuenta_bancaria.numero_cuenta} rango(#{numero_cheque_inicial} - #{numero_cheque_final})"
	end
end