class CreateMovimientosDeCajas < ActiveRecord::Migration
  def change
    create_table :movimientos_de_cajas do |t|
      t.references :tipo_de_movimiento, index: true
      t.references :caja, index: true
      t.string :descripcion

      t.timestamps
    end
  end
end
