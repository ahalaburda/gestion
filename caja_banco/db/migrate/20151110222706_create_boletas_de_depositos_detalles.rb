class CreateBoletasDeDepositosDetalles < ActiveRecord::Migration
  def change
    create_table :boletas_de_depositos_detalles do |t|
      t.references :boleta_de_deposito, index: true
      t.references :cheque_entrante, index: true
      t.decimal :monto_efectivo
      t.decimal :monto_cheque
      t.decimal :total

      t.timestamps
    end
  end
end
