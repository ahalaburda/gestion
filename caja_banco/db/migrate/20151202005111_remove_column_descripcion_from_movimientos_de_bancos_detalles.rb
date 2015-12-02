class RemoveColumnDescripcionFromMovimientosDeBancosDetalles < ActiveRecord::Migration
  def change
    remove_column :movimientos_de_bancos_detalles, :descripcion
  end
end
