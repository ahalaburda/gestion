class RemoveColumnsOfCaja < ActiveRecord::Migration
  def self.up
  	remove_column :cajas, :persona_id
  	remove_column :cajas, :apertura
  	remove_column :cajas, :cierre
  	remove_column :cajas, :saldo_inicial_efectivo
  	remove_column :cajas, :saldo_final_efectivo
  	remove_column :cajas, :saldo_inicial_cheque
  	remove_column :cajas, :saldo_final_cheque
  end
end
