class AddColumnToTableMovimientosDeCajas < ActiveRecord::Migration
  def change
  	add_column :movimientos_de_cajas, :total, :decimal
  end
end
