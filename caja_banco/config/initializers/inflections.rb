# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
 ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
	inflect.irregular 'tipo_de_movimiento', 'tipos_de_movimientos'
	inflect.irregular 'tipo_de_persona', 'tipos_de_personas'
	inflect.irregular 'pais', 'paises'
	inflect.irregular 'ciudad', 'ciudades'
	inflect.irregular 'cheque_entrante', 'cheques_entrantes'
	inflect.irregular 'cuenta_bancaria', 'cuentas_bancarias'
	inflect.irregular 'cheque_propio', 'cheques_propios'
  inflect.irregular 'auditoria', 'auditorias'
  inflect.irregular 'boleta_de_deposito', 'boletas_de_depositos'
  inflect.irregular 'boleta_de_deposito_detalle', 'boletas_de_depositos_detalles'
  inflect.irregular 'movimiento_de_banco', 'movimientos_de_bancos'
  inflect.irregular 'movimiento_de_banco_detalle', 'movimientos_de_bancos_detalles'
  inflect.irregular 'movimiento_de_caja', 'movimientos_de_cajas'
  inflect.irregular 'movimiento_de_caja_detalle', 'movimientos_de_cajas_detalles'
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
 end
