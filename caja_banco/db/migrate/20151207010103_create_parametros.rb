class CreateParametros < ActiveRecord::Migration
  def change
    create_table :parametros do |t|
      t.string :nombre_empresa
      t.string :logo_empresa

      t.timestamps
    end
  end
end
