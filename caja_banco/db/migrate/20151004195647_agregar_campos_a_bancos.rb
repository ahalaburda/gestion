class AgregarCamposABancos < ActiveRecord::Migration
  def change
  	add_column :bancos, :sucursal, :string
  	add_column :bancos, :pais_id, :integer
  	add_column :bancos, :departamento_id, :integer
  	add_column :bancos, :ciudad_id,:integer
  	add_column :bancos, :correo, :string
  end
end
