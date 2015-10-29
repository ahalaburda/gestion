class CreateChequeras < ActiveRecord::Migration
  def change
    create_table :chequeras do |t|
      t.references :cuenta_bancaria, index: true

      t.timestamps
    end
  end
end
