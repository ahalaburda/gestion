class CreateCuentas < ActiveRecord::Migration
  def change
    create_table :cuentas do |t|
      t.integer :numero_cuenta_contable
      t.string :descripcion

      t.timestamps
    end
  end
end
