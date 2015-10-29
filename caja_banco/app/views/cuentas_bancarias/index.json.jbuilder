json.array!(@cuentas_bancarias) do |cuenta_bancaria|
  json.extract! cuenta_bancaria, :id, :banco_id, :numero_cuenta, :fecha_apertura, :saldo, :estado_id
  json.url cuenta_bancaria_url(cuenta_bancaria, format: :json)
end
