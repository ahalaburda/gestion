class RemoveColumnInTableMovimientosDeCajasDetalles < ActiveRecord::Migration
  def change
  	remove_column :movimientos_de_cajas_detalles, :descripcion
  end
end
