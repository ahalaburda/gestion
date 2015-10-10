json.array!(@estados) do |estado|
  json.extract! estado, :id, :descripcion
  json.url estado_url(estado, format: :json)
end
