json.array!(@cajas) do |caja|
  json.extract! caja, :id, :apertura, :cierre, :saldo_inicial_efectivo, :saldo_inicial_cheque, :saldo_final_efectivo, :saldo_final_cheque, :estado_id, :persona_id, :numero
  json.url caja_url(caja, format: :json)
end
