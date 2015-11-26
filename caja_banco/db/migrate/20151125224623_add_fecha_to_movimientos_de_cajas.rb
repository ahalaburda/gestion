class AddFechaToMovimientosDeCajas < ActiveRecord::Migration
  def change
    add_column :movimientos_de_cajas, :fecha, :date
  end
end
