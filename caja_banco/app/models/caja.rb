class Caja < ActiveRecord::Base
  belongs_to :estado
  belongs_to :persona

  validates :estado_id,
		:presence => {
			message: 'Este campo es requerido'}
	validates :persona_id,
		:presence => {
			message: 'Este campo es requerido'}
	validates :apertura,
		:presence => {
			message: 'Este campo es requerido'}
	validates :saldo_inicial_efectivo,
	 :presence => {
	 	message: 'Este campo es requerido'}
	validates :saldo_inicial_cheque,
	 :presence => {
	 	message: 'Este campo es requerido'}
end