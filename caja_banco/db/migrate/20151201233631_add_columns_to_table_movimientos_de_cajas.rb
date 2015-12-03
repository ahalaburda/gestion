class AddColumnsToTableMovimientosDeCajas < ActiveRecord::Migration
  def change
  	add_column :movimientos_de_cajas, :monto_total_efectivo, :decimal
  	add_column :movimientos_de_cajas, :monto_total_cheque, :decimal
  end
end
