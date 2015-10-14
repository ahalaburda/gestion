json.array!(@paises) do |pais|
  json.extract! pais, :id, :descripcion
  json.url pais_url(pais, format: :json)
end
