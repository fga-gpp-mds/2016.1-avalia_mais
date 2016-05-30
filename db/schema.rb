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

ActiveRecord::Schema.define(version: 20160530145136) do

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name",              limit: 255
    t.text     "address",           limit: 65535
    t.string   "telephone",         limit: 255
    t.string   "email",             limit: 255
    t.boolean  "authenticated"
    t.text     "description",       limit: 65535
    t.integer  "segment_id",        limit: 4
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
    t.integer  "uf_id",             limit: 4
    t.string   "segment",           limit: 255
  end

  add_index "companies", ["segment_id"], name: "index_companies_on_segment_id", using: :btree
  add_index "companies", ["uf_id"], name: "index_companies_on_uf_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "response_time", limit: 4
    t.integer  "grade",         limit: 4
    t.string   "resolved",      limit: 255
    t.integer  "rate",          limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "company_id",    limit: 4
    t.integer  "uf_id",         limit: 4
    t.integer  "user_id",       limit: 4
  end

  add_index "evaluations", ["company_id"], name: "index_evaluations_on_company_id", using: :btree
  add_index "evaluations", ["uf_id"], name: "index_evaluations_on_uf_id", using: :btree
  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "rates",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "parsers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "secret",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "survey_answers", force: :cascade do |t|
    t.integer  "attempt_id",  limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "option_id",   limit: 4
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", force: :cascade do |t|
    t.integer "participant_id",   limit: 4
    t.string  "participant_type", limit: 255
    t.integer "survey_id",        limit: 4
    t.boolean "winner"
    t.integer "score",            limit: 4
  end

  create_table "survey_options", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "weight",      limit: 4,   default: 0
    t.string   "text",        limit: 255
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer  "survey_id",  limit: 4
    t.string   "text",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.integer  "attempts_number", limit: 4,     default: 0
    t.boolean  "finished",                      default: false
    t.boolean  "active",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "description",      limit: 65535
    t.integer  "total",            limit: 4
    t.integer  "options_quantity", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "ufs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "gender",          limit: 255
    t.string   "password_digest", limit: 255
    t.string   "login",           limit: 255
    t.date     "dateBirthday"
    t.string   "image",           limit: 255
    t.boolean  "active"
    t.boolean  "admin"
    t.integer  "uf_id",           limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string   "secret",      limit: 255
    t.integer  "question_id", limit: 4
    t.integer  "option_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "companies", "segments"
  add_foreign_key "companies", "ufs"
  add_foreign_key "evaluations", "companies"
  add_foreign_key "evaluations", "ufs"
  add_foreign_key "evaluations", "users"
end
