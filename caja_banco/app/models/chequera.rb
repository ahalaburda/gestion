class Chequera < ActiveRecord::Base
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
end
