class CreatePaises < ActiveRecord::Migration
  def change
    create_table :paises do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
