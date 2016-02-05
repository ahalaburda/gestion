class CreateAsientosAutomaticosDetalles < ActiveRecord::Migration
  def change
    create_table :asientos_automaticos_detalles do |t|
      t.references :asiento_automatico, index: true
      t.references :cuenta, index: true
      t.decimal :monto_debito
      t.decimal :monto_credito

      t.timestamps
    end
  end
end
