class CreateBoletasDeDepositos < ActiveRecord::Migration
  def change
    create_table :boletas_de_depositos do |t|
      t.references :banco, index: true
      t.references :persona, index: true
      t.references :cuenta_bancaria, index: true
      t.references :caja, index: true
      t.date :fecha

      t.timestamps
    end
  end
end
