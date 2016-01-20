class ChequePropio < ActiveRecord::Base
  audited
  belongs_to :chequera
  has_many :movimientos_de_cajas_detalles

	validates :chequera_id,
		:presence => {
			message: 'Seleccione una chequera'}

	validates :numero_cheque,
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

	def nombre
		"#{numero_cheque} - #{monto} "
	end
end