json.array!(@apertura_cajas) do |apertura_caja|
  json.extract! apertura_caja, :id, :caja_id, :apertura, :cierre, :saldo_inicial_efectivo, :saldo_inicial_cheque, :saldo_final_efectivo, :saldo_final_cheque, :persona_id
  json.url apertura_caja_url(apertura_caja, format: :json)
end
