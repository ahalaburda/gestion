class Caja < ActiveRecord::Base
  belongs_to :estado
  has_many :movimientos_de_cajas
  has_many :boletas_de_depositos

  validates :estado_id,
		:presence => {
			message: 'Este campo es requerido'}

end
