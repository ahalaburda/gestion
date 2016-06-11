class EliminarCampoConceptoDeChequeEntrante < ActiveRecord::Migration
  def change
  	remove_column :cheques_entrantes, :concepto
  end
end
