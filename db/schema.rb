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

ActiveRecord::Schema.define(version: 20150220201031) do

  create_table "rad_operaciones", force: true do |t|
    t.date     "fecha"
    t.decimal  "importe",          precision: 12, scale: 4
    t.integer  "operaciontipo_id"
    t.integer  "cuotas",                                    default: 1
    t.integer  "ctaD_id"
    t.integer  "ctaH_id"
    t.text     "desc"
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cuotaimporte",     precision: 12, scale: 4
    t.integer  "asiento_id"
    t.boolean  "rdosxmes",                                  default: false
  end

  add_index "rad_operaciones", ["ctaD_id"], name: "index_rad_operaciones_on_ctaD_id", using: :btree
  add_index "rad_operaciones", ["ctaH_id"], name: "index_rad_operaciones_on_ctaH_id", using: :btree
  add_index "rad_operaciones", ["empresa_id"], name: "index_rad_operaciones_on_empresa_id", using: :btree
  add_index "rad_operaciones", ["operaciontipo_id"], name: "index_rad_operaciones_on_operaciontipo_id", using: :btree

  create_table "rad_operacionregistros", force: true do |t|
    t.integer  "operacion_id"
    t.integer  "ctaD_id"
    t.integer  "ctaH_id"
    t.decimal  "valor",        precision: 12, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rad_operacionregistros", ["operacion_id"], name: "index_rad_operacionregistros_on_operacion_id", using: :btree

  create_table "rad_operaciontipos", force: true do |t|
    t.integer  "estado"
    t.integer  "codigo"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "idmascara"
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

  create_table "rba_organizaciones", force: true do |t|
    t.integer  "estado"
    t.string   "nombre"
    t.string   "desc"
    t.integer  "catfiscal_id"
    t.string   "idfiscal"
    t.integer  "organizaciontipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresagrupo_id"
    t.text     "domicilio"
  end

  add_index "rba_organizaciones", ["catfiscal_id"], name: "index_rba_organizaciones_on_catfiscal_id", using: :btree
  add_index "rba_organizaciones", ["organizaciontipo_id"], name: "index_rba_organizaciones_on_organizaciontipo_id", using: :btree

  create_table "rba_organizaciontipos", force: true do |t|
    t.string   "nombre"
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "desc"
  end

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

  create_table "rco_aplicaciones", force: true do |t|
    t.integer  "reg_debe_id"
    t.integer  "reg_haber_id"
    t.decimal  "importe",      precision: 12, scale: 4, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rco_aplicaciones", ["reg_debe_id"], name: "index_rco_aplicaciones_on_reg_debe_id", using: :btree
  add_index "rco_aplicaciones", ["reg_haber_id"], name: "index_rco_aplicaciones_on_reg_haber_id", using: :btree

  create_table "rco_asientos", force: true do |t|
    t.date     "fecha"
    t.integer  "moneda_id"
    t.decimal  "cotizacion", precision: 12, scale: 4
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "empresa_id"
    t.boolean  "esgenerado",                          default: false
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
    t.integer  "estado",     default: 1, null: false
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

  create_table "rga_animales_registros", force: true do |t|
    t.integer  "animal_id"
    t.integer  "registro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rga_animales_registros", ["animal_id"], name: "index_rga_animales_registros_on_animal_id", using: :btree
  add_index "rga_animales_registros", ["registro_id"], name: "index_rga_animales_registros_on_registro_id", using: :btree

  create_table "rga_categorias", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.integer  "categoriatipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "pesopromedio",     precision: 12, scale: 4, default: 0.0, null: false
  end

  add_index "rga_categorias", ["categoriatipo_id"], name: "index_rga_categorias_on_categoriatipo_id", using: :btree

  create_table "rga_categoriatipos", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rga_categoriatipos_estados", force: true do |t|
    t.integer "categoriatipo_id"
    t.integer "estado_id"
  end

  add_index "rga_categoriatipos_estados", ["categoriatipo_id"], name: "index_rga_categoriatipos_estados_on_categoriatipo_id", using: :btree
  add_index "rga_categoriatipos_estados", ["estado_id"], name: "index_rga_categoriatipos_estados_on_estado_id", using: :btree

  create_table "rga_categoriatipos_eventos", force: true do |t|
    t.integer "categoriatipo_id"
    t.integer "evento_id"
  end

  add_index "rga_categoriatipos_eventos", ["categoriatipo_id"], name: "index_rga_categoriatipos_eventos_on_categoriatipo_id", using: :btree
  add_index "rga_categoriatipos_eventos", ["evento_id"], name: "index_rga_categoriatipos_eventos_on_evento_id", using: :btree

  create_table "rga_estados", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rga_estados_eventos", force: true do |t|
    t.string   "codigo"
    t.integer  "estado_id"
    t.integer  "evento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rga_estados_eventos", ["estado_id"], name: "index_rga_estados_eventos_on_estado_id", using: :btree
  add_index "rga_estados_eventos", ["evento_id"], name: "index_rga_estados_eventos_on_evento_id", using: :btree

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

  create_table "rga_registros", force: true do |t|
    t.date     "fecha"
    t.integer  "empresa_id"
    t.integer  "establecimiento_id"
    t.integer  "evento_id"
    t.integer  "origcategoria_id"
    t.integer  "origrodeo_id"
    t.integer  "origestado_id"
    t.integer  "destcategoria_id"
    t.integer  "destrodeo_id"
    t.integer  "destestado_id"
    t.integer  "cantidad",                                   default: 1,   null: false
    t.decimal  "peso",               precision: 8, scale: 2, default: 0.0, null: false
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rga_registros", ["destcategoria_id"], name: "index_rga_registros_on_destcategoria_id", using: :btree
  add_index "rga_registros", ["destestado_id"], name: "index_rga_registros_on_destestado_id", using: :btree
  add_index "rga_registros", ["destrodeo_id"], name: "index_rga_registros_on_destrodeo_id", using: :btree
  add_index "rga_registros", ["empresa_id"], name: "index_rga_registros_on_empresa_id", using: :btree
  add_index "rga_registros", ["establecimiento_id"], name: "index_rga_registros_on_establecimiento_id", using: :btree
  add_index "rga_registros", ["evento_id"], name: "index_rga_registros_on_evento_id", using: :btree
  add_index "rga_registros", ["origcategoria_id"], name: "index_rga_registros_on_origcategoria_id", using: :btree
  add_index "rga_registros", ["origestado_id"], name: "index_rga_registros_on_origestado_id", using: :btree
  add_index "rga_registros", ["origrodeo_id"], name: "index_rga_registros_on_origrodeo_id", using: :btree

  create_table "rga_rodeos", force: true do |t|
    t.integer  "estado"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
