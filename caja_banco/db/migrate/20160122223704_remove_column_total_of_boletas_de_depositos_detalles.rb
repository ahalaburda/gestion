class RemoveColumnTotalOfBoletasDeDepositosDetalles < ActiveRecord::Migration
	def change
		remove_column :boletas_de_depositos_detalles, :total
	end
end