class CreateAsientosAutomaticos < ActiveRecord::Migration
  def change
    create_table :asientos_automaticos do |t|
      t.integer :tipo_de_asiento
      t.string :descripcion
      t.date :fecha

      t.timestamps
    end
  end
end
