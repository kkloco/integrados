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

ActiveRecord::Schema.define(version: 20171102112819) do

  create_table "cars", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "matricula"
    t.string   "localizacion"
    t.string   "conductor"
    t.string   "finalidad"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["matricula"], name: "index_cars_on_matricula", using: :btree
  end

  create_table "councils", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "nombre",         limit: 65535
    t.text     "responsable",    limit: 65535
    t.integer  "id_responsable"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.index ["id"], name: "index_councils_on_ID", unique: true, using: :btree
    t.index ["user_id"], name: "index_councils_on_user_id", using: :btree
  end

  create_table "ecyears", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "ejercicio"
    t.integer  "orden"
    t.integer  "activo"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "orden_vale"
    t.integer  "orden_combustible"
    t.index ["ejercicio"], name: "index_ecyears_on_ejercicio", unique: true, using: :btree
  end

  create_table "gas", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "numcomb"
    t.string   "matricula"
    t.string   "proveedor"
    t.string   "concepto"
    t.float    "importe",      limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "year"
    t.integer  "id_prov"
    t.string   "departamento"
    t.integer  "dep_id"
    t.index ["numcomb"], name: "index_gas_on_numcomb", using: :btree
    t.index ["user_id"], name: "index_gas_on_user_id", using: :btree
  end

  create_table "joins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "council_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["council_id"], name: "index_joins_on_council_id", using: :btree
    t.index ["user_id"], name: "index_joins_on_user_id", using: :btree
  end

  create_table "positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["nombre"], name: "index_positions_on_nombre", unique: true, using: :btree
  end

  create_table "proposals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "numprop",        limit: 65535
    t.integer  "year"
    t.text     "proyecto",       limit: 65535
    t.text     "departamento",   limit: 65535
    t.bigint   "rc"
    t.text     "tercero",        limit: 65535
    t.text     "cif",            limit: 65535
    t.text     "contrato",       limit: 65535
    t.text     "acuerdos",       limit: 65535
    t.text     "convenios",      limit: 65535
    t.text     "otros",          limit: 65535
    t.text     "finalidad",      limit: 65535
    t.text     "objeto",         limit: 65535
    t.float    "importe",        limit: 24
    t.text     "empleado_firma", limit: 65535
    t.text     "politico_firma", limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.integer  "dep_id"
    t.integer  "ter_id"
    t.string   "partida"
    t.index ["numprop"], name: "index_proposals_on_numprop", unique: true, length: { numprop: 255 }, using: :btree
    t.index ["user_id"], name: "index_proposals_on_user_id", using: :btree
  end

  create_table "providers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "CIF"
    t.string   "razon_social"
    t.string   "contacto"
    t.string   "direccion"
    t.string   "poblacion"
    t.integer  "cod_postal"
    t.string   "provincia"
    t.integer  "tlf2"
    t.integer  "tlf1"
    t.integer  "fax"
    t.string   "web"
    t.string   "email"
    t.float    "tope_gasto",   limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["CIF"], name: "index_providers_on_CIF", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nombre"
    t.string   "dni"
    t.string   "rol"
    t.string   "cargo"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_users_on_user_id", using: :btree
  end

  create_table "vouchers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "numvale",      limit: 65535
    t.text     "numprop",      limit: 65535
    t.integer  "year"
    t.text     "departamento", limit: 65535
    t.bigint   "rc"
    t.text     "tercero",      limit: 65535
    t.text     "finalidad",    limit: 65535
    t.text     "objeto",       limit: 65535
    t.float    "importe",      limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "orden_vale"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.index ["numvale"], name: "index_vouchers_on_numvale", unique: true, length: { numvale: 255 }, using: :btree
    t.index ["proposal_id"], name: "index_vouchers_on_proposal_id", using: :btree
    t.index ["user_id"], name: "index_vouchers_on_user_id", using: :btree
  end

  add_foreign_key "gas", "users"
  add_foreign_key "joins", "councils"
  add_foreign_key "joins", "users"
  add_foreign_key "proposals", "users"
  add_foreign_key "vouchers", "proposals"
  add_foreign_key "vouchers", "users"
end
