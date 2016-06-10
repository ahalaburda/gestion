class AgregarPrecisionALosCamposNumericosTipoEfectivo < ActiveRecord::Migration
  def change
  	change_column :apertura_cajas, :saldo_inicial_efectivo, :decimal, :precision => 15
  	change_column :apertura_cajas, :saldo_inicial_cheque, :decimal, :precision => 15
  	change_column :apertura_cajas, :saldo_final_efectivo, :decimal, :precision => 15
  	change_column :apertura_cajas, :saldo_final_cheque, :decimal, :precision => 15

  	change_column :apertura_cajas_detalles, :monto, :decimal, :precision => 15

  	change_column :asientos_automaticos_detalles, :monto_debito, :decimal, :precision => 15
  	change_column :asientos_automaticos_detalles, :monto_credito, :decimal, :precision => 15

  	change_column :boletas_de_depositos, :total, :decimal, :precision => 15
  	change_column :boletas_de_depositos, :monto_total_efectivo, :decimal, :precision => 15
  	change_column :boletas_de_depositos, :monto_total_cheque, :decimal, :precision => 15

  	change_column :boletas_de_depositos_detalles, :monto_efectivo, :decimal, :precision => 15
  	change_column :boletas_de_depositos_detalles, :monto_cheque, :decimal, :precision => 15

  	change_column :cheques_entrantes, :monto, :decimal, :precision => 15

  	change_column :cheques_propios, :monto, :decimal, :precision => 15

  	change_column :cuentas_bancarias, :saldo, :decimal, :precision => 15

  	change_column :movimientos_de_bancos, :total, :decimal, :precision => 15

  	change_column :movimientos_de_bancos_detalles, :monto, :decimal, :precision => 15

  	change_column :movimientos_de_cajas, :total, :decimal, :precision => 15
  	change_column :movimientos_de_cajas, :monto_total_cheque, :decimal, :precision => 15
  	change_column :movimientos_de_cajas, :monto_total_efectivo, :decimal, :precision => 15

  	change_column :movimientos_de_cajas_detalles, :monto_efectivo, :decimal, :precision => 15
  	change_column :movimientos_de_cajas_detalles, :monto_cheque, :decimal, :precision => 15
  end
end
