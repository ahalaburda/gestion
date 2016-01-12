class Caja < ActiveRecord::Base
  audited
  belongs_to :estado
  has_many :movimientos_de_cajas
  has_many :boletas_de_depositos
  has_many :apertura_cajas

  validates :estado_id,
		:presence => {
			message: 'Este campo es requerido'}
  validates :numero, presence: true, numericality: true

      def numero_caja
          "#{numero}"
      end
end
