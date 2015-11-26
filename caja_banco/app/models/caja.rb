class Caja < ActiveRecord::Base
  belongs_to :estado
  has_many :movimientos_de_cajas
  has_many :boletas_de_depositos
  has_many :apertura_cajas

  validates :estado_id,
		:presence => {
			message: 'Este campo es requerido'}

      def numero_caja
          "#{numero}"
      end
end
