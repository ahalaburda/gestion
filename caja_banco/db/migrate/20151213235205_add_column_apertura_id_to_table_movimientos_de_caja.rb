class AddColumnAperturaIdToTableMovimientosDeCaja < ActiveRecord::Migration
  def change
  	add_column :movimientos_de_cajas, :apertura_id, :integer
  end
end
