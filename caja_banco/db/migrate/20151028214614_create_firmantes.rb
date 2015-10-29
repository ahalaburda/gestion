class CreateFirmantes < ActiveRecord::Migration
  def change
    create_table :firmantes do |t|
      t.references :cuenta_bancaria, index: true
      t.references :persona, index: true

      t.timestamps
    end
  end
end
