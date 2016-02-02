class ChequeEntrante < ActiveRecord::Base
	audited
	belongs_to :banco
	belongs_to :persona
	belongs_to :caja
	belongs_to :estado
	
	has_many :movimientos_de_cajas_detalles
	has_many :boletas_de_depositos_detalles

	after_create :set_estado_a_cobrar

	validates :banco_id,
		:presence => {
		message: 'Seleccione un banco'}
	validates :numero,
		:presence => {
			message: 'Este campo es requerido'},
		:numericality => true,
		:length => { maximum: 30  }
	validates :monto,
		:presence => {
			message: 'Este campo es requerido'}
	validates :fecha,
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

	def nombre
		banco = Banco.find(banco_id)
		"#{numero} - #{banco.nombre} - #{monto} "
	end
	def nombre_corto
		banco = Banco.find(banco_id)
		"#{banco.nombre} - Nº #{numero}"
	end
	def set_estado_a_cobrar
		cheque = ChequeEntrante.find(self.id)
		cheque.estado_id = 9
		cheque.save
	end
	def set_estado_cobrado
		cheque = ChequeEntrante.find(self.cheque_entrante_id)
		cheque.estado_id = 3
		cheque.save
	end
end