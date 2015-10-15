class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.references :tipo_de_persona, index: true
      t.references :categoria, index: true
      t.string :nombre
      t.string :apellido
      t.integer :telefono
      t.integer :cedula_identidad
      t.references :pais, index: true
      t.references :departamento, index: true
      t.references :ciudad, index: true
      t.string :direccion
      t.date :fecha_de_nacimiento
      t.string :correo

      t.timestamps
    end
  end
end
