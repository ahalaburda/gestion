json.array!(@cuentas) do |cuenta|
  json.extract! cuenta, :id, :numero_cuenta_contable, :descripcion
  json.url cuenta_url(cuenta, format: :json)
end
