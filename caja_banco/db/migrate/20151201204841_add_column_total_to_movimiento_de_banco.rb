class AddColumnTotalToMovimientoDeBanco < ActiveRecord::Migration
  def change
    add_column :movimientos_de_bancos, :total, :decimal
  end
end
