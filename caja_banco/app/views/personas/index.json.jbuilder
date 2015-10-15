json.array!(@personas) do |persona|
  json.extract! persona, :id, :tipo_de_persona_id, :categoria_id, :nombre, :apellido, :telefono, :cedula_identidad, :pais_id, :departamento_id, :ciudad_id, :direccion, :fecha_de_nacimiento, :correo
  json.url persona_url(persona, format: :json)
end
