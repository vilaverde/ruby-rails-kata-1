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

ActiveRecord::Schema.define(version: 2020_03_01_215909) do

  create_table "authors", force: :cascade do |t|
    t.string "email"
    t.string "firstname"
    t.string "lastname"
  end

  create_table "authors_publications", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "publication_id", null: false
    t.index ["author_id", "publication_id"], name: "index_authors_publications_on_author_id_and_publication_id"
    t.index ["publication_id", "author_id"], name: "index_authors_publications_on_publication_id_and_author_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "isbn"
    t.datetime "published_at"
    t.index ["isbn"], name: "index_publications_on_isbn"
  end

end
