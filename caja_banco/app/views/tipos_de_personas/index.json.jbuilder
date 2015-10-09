json.array!(@tipos_de_personas) do |tipo_de_persona|
  json.extract! tipo_de_persona, :id, :descripcion
  json.url tipo_de_persona_url(tipo_de_persona, format: :json)
end
