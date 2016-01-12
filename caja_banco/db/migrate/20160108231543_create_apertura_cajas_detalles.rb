class CreateAperturaCajasDetalles < ActiveRecord::Migration
  def change
    create_table :apertura_cajas_detalles do |t|
      t.references :apertura_caja, index: true
      t.references :cheque_entrante, index: true
      t.decimal :monto

      t.timestamps
    end
  end
end
