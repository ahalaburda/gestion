class AddColumnTotalToBoletaDeDeposito < ActiveRecord::Migration
  def change
    add_column :boletas_de_depositos, :total, :decimal
  end
end
