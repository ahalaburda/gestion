class CreateAuditorias < ActiveRecord::Migration
  def change
    create_table :auditorias do |t|
      t.string :nombre_tabla
      t.string :operacion
      t.string :valor_anterior
      t.string :valor_nuevo
      t.string :nombre_usuario

      t.timestamps
    end
  end
end
