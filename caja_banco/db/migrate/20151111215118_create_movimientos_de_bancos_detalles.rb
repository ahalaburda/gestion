class CreateMovimientosDeBancosDetalles < ActiveRecord::Migration
  def change
    create_table :movimientos_de_bancos_detalles do |t|
      t.references :movimiento_de_banco, index: true
      t.references :cuenta_bancaria, index: true
      t.string :descripcion
      t.decimal :monto

      t.timestamps
    end
  end
end
