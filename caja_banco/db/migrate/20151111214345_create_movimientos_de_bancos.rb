class CreateMovimientosDeBancos < ActiveRecord::Migration
  def change
    create_table :movimientos_de_bancos do |t|
      t.references :tipo_de_movimiento, index: true
      t.references :banco, index: true
      t.string :descripcion

      t.timestamps
    end
  end
end
