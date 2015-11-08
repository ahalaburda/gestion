json.array!(@auditorias) do |auditoria|
  json.extract! auditoria, :id, :nombre_tabla, :operacion, :valor_anterior, :valor_nuevo, :nombre_usuario
  json.url auditoria_url(auditoria, format: :json)
end
