class CreateCuentasBancarias < ActiveRecord::Migration
  def change
    create_table :cuentas_bancarias do |t|
      t.references :banco, index: true
      t.integer :numero_cuenta
      t.date :fecha_apertura
      t.decimal :saldo
      t.references :estado, index: true

      t.timestamps
    end
  end
end
