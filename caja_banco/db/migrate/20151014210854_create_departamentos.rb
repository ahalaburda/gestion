class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :descripcion
      t.references :pais, index: true

      t.timestamps
    end
  end
end
