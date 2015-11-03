class CreateCajas < ActiveRecord::Migration
  def change
    create_table :cajas do |t|
      t.date :apertura
      t.date :cierre
      t.decimal :saldo_inicial_efectivo
      t.decimal :saldo_inicial_cheque
      t.decimal :saldo_final_efectivo
      t.decimal :saldo_final_cheque
      t.references :estado, index: true
      t.references :persona, index: true

      t.timestamps
    end
  end
end
