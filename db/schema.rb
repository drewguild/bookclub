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

ActiveRecord::Schema.define(version: 20200624191040) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "thumbnail"
  end

  create_table "books_collections", id: false, force: :cascade do |t|
    t.integer "collection_id", null: false
    t.integer "book_id", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.integer "club_id"
    t.string "type"
    t.string "label"
    t.integer "owner_id"
    t.string "owner_type"
  end

  create_table "meetings", force: :cascade do |t|
    t.date "held_on"
    t.integer "club_id"
    t.date "selection_deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nominations", force: :cascade do |t|
    t.integer "book_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "text"
    t.integer "score"
    t.integer "book_id"
    t.integer "member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "member_id"
    t.integer "nomination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
