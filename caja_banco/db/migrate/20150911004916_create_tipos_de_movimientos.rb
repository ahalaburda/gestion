class CreateTiposDeMovimientos < ActiveRecord::Migration
  def change
    create_table :tipos_de_movimientos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
