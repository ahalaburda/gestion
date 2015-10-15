json.array!(@departamentos) do |departamento|
  json.extract! departamento, :id, :descripcion, :pais_id
  json.url departamento_url(departamento, format: :json)
end
