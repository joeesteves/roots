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

ActiveRecord::Schema.define(version: 20140723220559) do

  create_table "rba_actividades", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "estado"
    t.text     "desc"
    t.integer  "actividadtipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rba_actividades", ["actividadtipo_id"], name: "index_rba_actividades_on_actividadtipo_id", using: :btree

  create_table "rba_actividadtipos", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rba_arboles", force: true do |t|
    t.string   "nombre"
    t.string   "modelo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rba_arboles", ["modelo"], name: "index_rba_arboles_on_modelo", using: :btree

  create_table "rba_campanas", force: true do |t|
    t.string   "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.integer  "temporada_id"
    t.integer  "campanatipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rba_campanas", ["campanatipo_id"], name: "index_rba_campanas_on_campanatipo_id", using: :btree
  add_index "rba_campanas", ["temporada_id"], name: "index_rba_campanas_on_temporada_id", using: :btree

  create_table "rba_campanatipos", force: true do |t|
    t.string   "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rba_catfiscales", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rba_empresagrupos", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rba_empresas", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "catfiscal_id"
    t.string   "cuit"
    t.integer  "empresagrupo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rba_empresas", ["catfiscal_id"], name: "index_rba_empresas_on_catfiscal_id", using: :btree
  add_index "rba_empresas", ["empresagrupo_id"], name: "index_rba_empresas_on_empresagrupo_id", using: :btree

  create_table "rba_establecimientos", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.text     "desc"
    t.decimal  "superficie",      precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresagrupo_id"
    t.integer  "estado"
  end

  create_table "rba_items_nodos", force: true do |t|
    t.integer "item_id"
    t.integer "nodo_id"
  end

  add_index "rba_items_nodos", ["item_id"], name: "index_rba_items_nodos_on_item_id", using: :btree
  add_index "rba_items_nodos", ["nodo_id"], name: "index_rba_items_nodos_on_nodo_id", using: :btree

  create_table "rba_lotes", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.text     "desc"
    t.integer  "establecimiento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rba_lotes", ["establecimiento_id"], name: "index_rba_lotes_on_establecimiento_id", using: :btree

  create_table "rba_loteutilizaciones", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.integer  "lote_id"
    t.integer  "campana_id"
    t.integer  "actividad_id"
    t.decimal  "superficie",   precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rba_loteutilizaciones", ["actividad_id"], name: "index_rba_loteutilizaciones_on_actividad_id", using: :btree
  add_index "rba_loteutilizaciones", ["campana_id"], name: "index_rba_loteutilizaciones_on_campana_id", using: :btree
  add_index "rba_loteutilizaciones", ["lote_id"], name: "index_rba_loteutilizaciones_on_lote_id", using: :btree

  create_table "rba_nodos", force: true do |t|
    t.string   "nombre"
    t.integer  "arbol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "padre_id"
  end

  add_index "rba_nodos", ["arbol_id"], name: "index_rba_nodos_on_arbol_id", using: :btree

  create_table "rba_temporadas", force: true do |t|
    t.string   "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.date     "desde"
    t.date     "hasta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rba_usuarios", force: true do |t|
    t.string   "usuario"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "mail"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rco_asientos", force: true do |t|
    t.date     "fecha"
    t.integer  "moneda_id"
    t.decimal  "cotizacion", precision: 12, scale: 4
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresa_id"
  end

  add_index "rco_asientos", ["moneda_id"], name: "index_rco_asientos_on_moneda_id", using: :btree

  create_table "rco_cotizaciones", force: true do |t|
    t.date     "fecha"
    t.decimal  "cotizacion", precision: 12, scale: 4
    t.integer  "moneda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rco_cotizaciones", ["moneda_id"], name: "index_rco_cotizaciones_on_moneda_id", using: :btree

  create_table "rco_cuentas", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "estado"
    t.text     "desc"
    t.integer  "cuentatipo_id"
    t.integer  "empresagrupo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rco_cuentas", ["cuentatipo_id"], name: "index_rco_cuentas_on_cuentatipo_id", using: :btree
  add_index "rco_cuentas", ["empresagrupo_id"], name: "index_rco_cuentas_on_empresagrupo_id", using: :btree

  create_table "rco_cuentatipos", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "estado"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rco_monedas", force: true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rco_registros", force: true do |t|
    t.date     "fecha"
    t.integer  "asiento_id"
    t.integer  "cuenta_id"
    t.decimal  "debe",        precision: 12, scale: 4, default: 0.0, null: false
    t.decimal  "haber",       precision: 12, scale: 4, default: 0.0, null: false
    t.date     "vencimiento"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "debe_op",     precision: 12, scale: 4, default: 0.0, null: false
    t.decimal  "haber_op",    precision: 12, scale: 4, default: 0.0, null: false
  end

  add_index "rco_registros", ["asiento_id"], name: "index_rco_registros_on_asiento_id", using: :btree
  add_index "rco_registros", ["cuenta_id"], name: "index_rco_registros_on_cuenta_id", using: :btree

  create_table "rga_animales", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "alias"
    t.string   "rp"
    t.string   "color"
    t.string   "desc"
    t.integer  "madre_id"
    t.integer  "padre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rga_animales", ["madre_id"], name: "index_rga_animales_on_madre_id", using: :btree
  add_index "rga_animales", ["padre_id"], name: "index_rga_animales_on_padre_id", using: :btree

  create_table "rga_estados", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rga_eventos", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "eventotipo_id"
  end

  create_table "rga_eventotipos", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rga_rodeos", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
