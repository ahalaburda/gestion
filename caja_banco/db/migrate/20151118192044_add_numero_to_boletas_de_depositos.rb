class AddNumeroToBoletasDeDepositos < ActiveRecord::Migration
  def change
    add_column :boletas_de_depositos, :numero, :integer
  end
end
