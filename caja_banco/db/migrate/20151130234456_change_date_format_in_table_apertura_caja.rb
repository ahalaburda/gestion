class ChangeDateFormatInTableAperturaCaja < ActiveRecord::Migration
  def change
  	change_column :apertura_cajas , :apertura ,:datetime
  	change_column :apertura_cajas , :cierre ,:datetime
  end
end
