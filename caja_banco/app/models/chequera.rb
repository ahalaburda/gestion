class Chequera < ActiveRecord::Base
  belongs_to :cuenta_bancaria

  validates :cuenta_bancaria_id,
				:presence => {
					message: 'Debe seleccionar un banco'}
end
