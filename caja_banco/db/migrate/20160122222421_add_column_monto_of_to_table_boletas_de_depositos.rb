class AddColumnMontoOfToTableBoletasDeDepositos < ActiveRecord::Migration
	def change
		add_column :boletas_de_depositos, :monto_total_efectivo, :decimal
		add_column :boletas_de_depositos, :monto_total_cheque, :decimal
	end
end