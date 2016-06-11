# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160610235950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apertura_cajas", force: true do |t|
    t.integer  "caja_id"
    t.datetime "apertura"
    t.datetime "cierre"
    t.decimal  "saldo_inicial_efectivo", precision: 15, scale: 0
    t.decimal  "saldo_inicial_cheque",   precision: 15, scale: 0
    t.decimal  "saldo_final_efectivo",   precision: 15, scale: 0
    t.decimal  "saldo_final_cheque",     precision: 15, scale: 0
    t.integer  "persona_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apertura_cajas", ["caja_id"], name: "index_apertura_cajas_on_caja_id", using: :btree
  add_index "apertura_cajas", ["persona_id"], name: "index_apertura_cajas_on_persona_id", using: :btree

  create_table "apertura_cajas_detalles", force: true do |t|
    t.integer  "apertura_caja_id"
    t.integer  "cheque_entrante_id"
    t.decimal  "monto",              precision: 15, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apertura_cajas_detalles", ["apertura_caja_id"], name: "index_apertura_cajas_detalles_on_apertura_caja_id", using: :btree
  add_index "apertura_cajas_detalles", ["cheque_entrante_id"], name: "index_apertura_cajas_detalles_on_cheque_entrante_id", using: :btree

  create_table "asientos_automaticos", force: true do |t|
    t.integer  "tipo_de_asiento"
    t.string   "descripcion"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asientos_automaticos_detalles", force: true do |t|
    t.integer  "asiento_automatico_id"
    t.integer  "cuenta_id"
    t.decimal  "monto_debito",          precision: 15, scale: 0
    t.decimal  "monto_credito",         precision: 15, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asientos_automaticos_detalles", ["asiento_automatico_id"], name: "index_asientos_automaticos_detalles_on_asiento_automatico_id", using: :btree
  add_index "asientos_automaticos_detalles", ["cuenta_id"], name: "index_asientos_automaticos_detalles_on_cuenta_id", using: :btree

  create_table "auditorias", force: true do |t|
    t.string   "nombre_tabla"
    t.string   "operacion"
    t.string   "valor_anterior"
    t.string   "valor_nuevo"
    t.string   "nombre_usuario"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audits", force: true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "bancos", force: true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sucursal"
    t.integer  "pais_id"
    t.integer  "departamento_id"
    t.integer  "ciudad_id"
    t.string   "correo"
  end

  add_index "bancos", ["ciudad_id"], name: "index_bancos_on_ciudad_id", using: :btree
  add_index "bancos", ["departamento_id"], name: "index_bancos_on_departamento_id", using: :btree
  add_index "bancos", ["pais_id"], name: "index_bancos_on_pais_id", using: :btree

  create_table "boletas_de_depositos", force: true do |t|
    t.integer  "banco_id"
    t.integer  "persona_id"
    t.integer  "cuenta_bancaria_id"
    t.integer  "caja_id"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "numero"
    t.decimal  "total",                precision: 15, scale: 0
    t.decimal  "monto_total_efectivo", precision: 15, scale: 0
    t.decimal  "monto_total_cheque",   precision: 15, scale: 0
  end

  add_index "boletas_de_depositos", ["banco_id"], name: "index_boletas_de_depositos_on_banco_id", using: :btree
  add_index "boletas_de_depositos", ["caja_id"], name: "index_boletas_de_depositos_on_caja_id", using: :btree
  add_index "boletas_de_depositos", ["cuenta_bancaria_id"], name: "index_boletas_de_depositos_on_cuenta_bancaria_id", using: :btree
  add_index "boletas_de_depositos", ["persona_id"], name: "index_boletas_de_depositos_on_persona_id", using: :btree

  create_table "boletas_de_depositos_detalles", force: true do |t|
    t.integer  "boleta_de_deposito_id"
    t.integer  "cheque_entrante_id"
    t.decimal  "monto_efectivo",        precision: 15, scale: 0
    t.decimal  "monto_cheque",          precision: 15, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boletas_de_depositos_detalles", ["boleta_de_deposito_id"], name: "index_boletas_de_depositos_detalles_on_boleta_de_deposito_id", using: :btree
  add_index "boletas_de_depositos_detalles", ["cheque_entrante_id"], name: "index_boletas_de_depositos_detalles_on_cheque_entrante_id", using: :btree

  create_table "cajas", force: true do |t|
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "numero"
  end

  add_index "cajas", ["estado_id"], name: "index_cajas_on_estado_id", using: :btree

  create_table "chequeras", force: true do |t|
    t.integer  "cuenta_bancaria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estado_id"
    t.integer  "numero_cheque_inicial"
    t.integer  "numero_cheque_final"
  end

  add_index "chequeras", ["cuenta_bancaria_id"], name: "index_chequeras_on_cuenta_bancaria_id", using: :btree

  create_table "cheques_entrantes", force: true do |t|
    t.integer  "banco_id"
    t.integer  "numero"
    t.date     "fecha"
    t.decimal  "monto",      precision: 15, scale: 0
    t.integer  "persona_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "caja_id"
    t.integer  "estado_id"
  end

  add_index "cheques_entrantes", ["banco_id"], name: "index_cheques_entrantes_on_banco_id", using: :btree
  add_index "cheques_entrantes", ["caja_id"], name: "index_cheques_entrantes_on_caja_id", using: :btree
  add_index "cheques_entrantes", ["estado_id"], name: "index_cheques_entrantes_on_estado_id", using: :btree
  add_index "cheques_entrantes", ["persona_id"], name: "index_cheques_entrantes_on_persona_id", using: :btree

  create_table "cheques_propios", force: true do |t|
    t.integer  "chequera_id"
    t.integer  "numero_cheque"
    t.date     "fecha"
    t.string   "concepto"
    t.decimal  "monto",         precision: 15, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cheques_propios", ["chequera_id"], name: "index_cheques_propios_on_chequera_id", using: :btree

  create_table "ciudades", force: true do |t|
    t.string   "descripcion"
    t.integer  "codigo_postal"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ciudades", ["departamento_id"], name: "index_ciudades_on_departamento_id", using: :btree

  create_table "cuentas", force: true do |t|
    t.integer  "numero_cuenta_contable"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuentas_bancarias", force: true do |t|
    t.integer  "banco_id"
    t.integer  "numero_cuenta"
    t.date     "fecha_apertura"
    t.decimal  "saldo",          precision: 15, scale: 0
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuentas_bancarias", ["banco_id"], name: "index_cuentas_bancarias_on_banco_id", using: :btree
  add_index "cuentas_bancarias", ["estado_id"], name: "index_cuentas_bancarias_on_estado_id", using: :btree

  create_table "departamentos", force: true do |t|
    t.string   "descripcion"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departamentos", ["pais_id"], name: "index_departamentos_on_pais_id", using: :btree

  create_table "estados", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "firmantes", force: true do |t|
    t.integer  "cuenta_bancaria_id"
    t.integer  "persona_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "firmantes", ["cuenta_bancaria_id"], name: "index_firmantes_on_cuenta_bancaria_id", using: :btree
  add_index "firmantes", ["persona_id"], name: "index_firmantes_on_persona_id", using: :btree

  create_table "movimientos_de_bancos", force: true do |t|
    t.integer  "tipo_de_movimiento_id"
    t.integer  "banco_id"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "fecha"
    t.decimal  "total",                 precision: 15, scale: 0
  end

  add_index "movimientos_de_bancos", ["banco_id"], name: "index_movimientos_de_bancos_on_banco_id", using: :btree
  add_index "movimientos_de_bancos", ["tipo_de_movimiento_id"], name: "index_movimientos_de_bancos_on_tipo_de_movimiento_id", using: :btree

  create_table "movimientos_de_bancos_detalles", force: true do |t|
    t.integer  "movimiento_de_banco_id"
    t.integer  "cuenta_bancaria_id"
    t.decimal  "monto",                  precision: 15, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movimientos_de_bancos_detalles", ["cuenta_bancaria_id"], name: "index_movimientos_de_bancos_detalles_on_cuenta_bancaria_id", using: :btree
  add_index "movimientos_de_bancos_detalles", ["movimiento_de_banco_id"], name: "index_movimientos_de_bancos_detalles_on_movimiento_de_banco_id", using: :btree

  create_table "movimientos_de_cajas", force: true do |t|
    t.integer  "tipo_de_movimiento_id"
    t.integer  "caja_id"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "fecha"
    t.decimal  "total",                 precision: 15, scale: 0
    t.decimal  "monto_total_efectivo",  precision: 15, scale: 0
    t.decimal  "monto_total_cheque",    precision: 15, scale: 0
    t.integer  "apertura_id"
  end

  add_index "movimientos_de_cajas", ["caja_id"], name: "index_movimientos_de_cajas_on_caja_id", using: :btree
  add_index "movimientos_de_cajas", ["tipo_de_movimiento_id"], name: "index_movimientos_de_cajas_on_tipo_de_movimiento_id", using: :btree

  create_table "movimientos_de_cajas_detalles", force: true do |t|
    t.integer  "movimiento_de_caja_id"
    t.integer  "cheque_entrante_id"
    t.integer  "cheque_propio_id"
    t.decimal  "monto_efectivo",        precision: 15, scale: 0
    t.decimal  "monto_cheque",          precision: 15, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movimientos_de_cajas_detalles", ["cheque_entrante_id"], name: "index_movimientos_de_cajas_detalles_on_cheque_entrante_id", using: :btree
  add_index "movimientos_de_cajas_detalles", ["cheque_propio_id"], name: "index_movimientos_de_cajas_detalles_on_cheque_propio_id", using: :btree
  add_index "movimientos_de_cajas_detalles", ["movimiento_de_caja_id"], name: "index_movimientos_de_cajas_detalles_on_movimiento_de_caja_id", using: :btree

  create_table "paises", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parametros", force: true do |t|
    t.string   "nombre_empresa"
    t.string   "logo_empresa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", force: true do |t|
    t.integer  "tipo_de_persona_id"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "telefono"
    t.integer  "cedula_identidad"
    t.integer  "pais_id"
    t.integer  "departamento_id"
    t.integer  "ciudad_id"
    t.string   "direccion"
    t.date     "fecha_de_nacimiento"
    t.string   "correo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personas", ["ciudad_id"], name: "index_personas_on_ciudad_id", using: :btree
  add_index "personas", ["departamento_id"], name: "index_personas_on_departamento_id", using: :btree
  add_index "personas", ["pais_id"], name: "index_personas_on_pais_id", using: :btree
  add_index "personas", ["tipo_de_persona_id"], name: "index_personas_on_tipo_de_persona_id", using: :btree

  create_table "tipos_de_movimientos", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_de_personas", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "persona_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["persona_id"], name: "index_users_on_persona_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
