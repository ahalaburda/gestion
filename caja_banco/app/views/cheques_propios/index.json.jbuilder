json.array!(@cheques_propios) do |cheque_propio|
  json.extract! cheque_propio, :id, :chequera_id, :numero_cheque, :fecha, :concepto, :monto
  json.url cheque_propio_url(cheque_propio, format: :json)
end
