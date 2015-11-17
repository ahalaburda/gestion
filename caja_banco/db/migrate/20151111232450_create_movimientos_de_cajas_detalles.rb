class CreateMovimientosDeCajasDetalles < ActiveRecord::Migration
  def change
    create_table :movimientos_de_cajas_detalles do |t|
      t.references :movimiento_de_caja, index: true
      t.references :cheque_entrante, index: true
      t.references :cheque_propio, index: true
      t.decimal :monto_efectivo
      t.decimal :monto_cheque
      t.string :descripcion

      t.timestamps
    end
  end
end
