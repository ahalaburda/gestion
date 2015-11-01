class AgregarCamposAchequeras < ActiveRecord::Migration
  def change
  	add_column :chequeras, :estado_id, :integer
  	add_column :chequeras, :numero_cheque_inicial, :integer
  	add_column :chequeras, :numero_cheque_final,:integer
  end
end
