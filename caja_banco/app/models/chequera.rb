class Chequera < ActiveRecord::Base
  belongs_to :cuenta_bancaria

  validates :cuenta_bancaria,
				:presence => {
					message: 'Debe seleccionar una cuenta bancaria'}
end
