class CreateCiudades < ActiveRecord::Migration
  def change
    create_table :ciudades do |t|
      t.string :descripcion
      t.integer :codigo_postal
      t.references :departamento, index: true

      t.timestamps
    end
  end
end
