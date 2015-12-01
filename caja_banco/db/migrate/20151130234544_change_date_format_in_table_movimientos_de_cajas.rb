class ChangeDateFormatInTableMovimientosDeCajas < ActiveRecord::Migration
  def change
  	change_column :movimientos_de_cajas , :fecha ,:datetime
  end
end
