class CreateChequesPropios < ActiveRecord::Migration
  def change
    create_table :cheques_propios do |t|
      t.references :chequera, index: true
      t.integer :numero_cheque
      t.date :fecha
      t.string :concepto
      t.decimal :monto

      t.timestamps
    end
  end
end
