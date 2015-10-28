json.array!(@firmantes) do |firmante|
  json.extract! firmante, :id, :cuenta_bancaria_id, :persona_id
  json.url firmante_url(firmante, format: :json)
end
