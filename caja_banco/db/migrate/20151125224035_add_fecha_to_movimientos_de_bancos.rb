class AddFechaToMovimientosDeBancos < ActiveRecord::Migration
  def change
    add_column :movimientos_de_bancos, :fecha, :date
  end
end
