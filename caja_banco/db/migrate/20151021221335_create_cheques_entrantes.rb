class CreateChequesEntrantes < ActiveRecord::Migration
  def change
    create_table :cheques_entrantes do |t|
      t.references :banco, index: true
      t.integer :numero
      t.date :fecha
      t.decimal :monto
      t.string :concepto
      t.references :persona, index: true

      t.timestamps
    end
  end
end
