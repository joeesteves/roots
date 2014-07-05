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

ActiveRecord::Schema.define(version: 20140704220110) do

  create_table "rba_arboles", force: true do |t|
    t.string   "nombre"
    t.string   "modelo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rba_arboles", ["modelo"], name: "index_rba_arboles_on_modelo", using: :btree

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

  create_table "rba_items_nodos", force: true do |t|
    t.integer "item_id"
    t.integer "nodo_id"
  end

  add_index "rba_items_nodos", ["item_id"], name: "index_rba_items_nodos_on_item_id", using: :btree
  add_index "rba_items_nodos", ["nodo_id"], name: "index_rba_items_nodos_on_nodo_id", using: :btree

  create_table "rba_nodos", force: true do |t|
    t.string   "nombre"
    t.integer  "arbol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "padre_id"
  end

  add_index "rba_nodos", ["arbol_id"], name: "index_rba_nodos_on_arbol_id", using: :btree

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
    t.decimal  "debe",        precision: 12, scale: 4
    t.decimal  "haber",       precision: 12, scale: 4
    t.date     "vencimiento"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rco_registros", ["asiento_id"], name: "index_rco_registros_on_asiento_id", using: :btree
  add_index "rco_registros", ["cuenta_id"], name: "index_rco_registros_on_cuenta_id", using: :btree

end
