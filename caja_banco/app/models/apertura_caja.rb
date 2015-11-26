class AperturaCaja < ActiveRecord::Base
  belongs_to :caja
  belongs_to :persona
  belongs_to :caja

  after_create :set_estado_abierto

  def set_estado_abierto
  	caja = Caja.find(self.caja_id)
  	caja.estado_id = 1
  	caja.save
  end

end
