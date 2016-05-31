class Caja < ActiveRecord::Base
  audited
  belongs_to :estado
  has_many :movimientos_de_cajas, dependent: :restrict_with_error
  has_many :boletas_de_depositos, dependent: :restrict_with_error
  has_many :apertura_cajas, dependent: :restrict_with_error

  validates :estado_id,
		:presence => {
			message: 'Este campo es requerido'}
  validates :numero,
    presence: true,
    numericality: true
  def numero_caja
    "#{numero}"
  end
end