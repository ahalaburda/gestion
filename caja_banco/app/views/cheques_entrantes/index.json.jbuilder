json.array!(@cheques_entrantes) do |cheque_entrante|
  json.extract! cheque_entrante, :id, :banco_id, :numero, :fecha, :monto, :concepto, :persona_id
  json.url cheque_entrante_url(cheque_entrante, format: :json)
end
