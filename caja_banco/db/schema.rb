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

ActiveRecord::Schema.define(version: 20151015005930) do

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

  create_table "ciudades", force: true do |t|
    t.string   "descripcion"
    t.integer  "codigo_postal"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ciudades", ["departamento_id"], name: "index_ciudades_on_departamento_id"

  create_table "departamentos", force: true do |t|
    t.string   "descripcion"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departamentos", ["pais_id"], name: "index_departamentos_on_pais_id"

  create_table "estados", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paises", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", force: true do |t|
    t.integer  "tipo_de_persona_id"
    t.integer  "categoria_id"
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

  add_index "personas", ["categoria_id"], name: "index_personas_on_categoria_id"
  add_index "personas", ["ciudad_id"], name: "index_personas_on_ciudad_id"
  add_index "personas", ["departamento_id"], name: "index_personas_on_departamento_id"
  add_index "personas", ["pais_id"], name: "index_personas_on_pais_id"
  add_index "personas", ["tipo_de_persona_id"], name: "index_personas_on_tipo_de_persona_id"

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

end
