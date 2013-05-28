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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130518171945) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 25
    t.string   "position",        :limit => 25
    t.string   "email",           :limit => 25, :null => false
    t.string   "hashed_password", :limit => 64
    t.string   "username",        :limit => 25
    t.string   "salt",            :limit => 25
    t.integer  "phone"
    t.string   "image"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "clubs", :force => true do |t|
    t.integer  "league_id",                    :null => false
    t.string   "name",          :limit => 45
    t.integer  "played"
    t.integer  "won"
    t.integer  "lost"
    t.integer  "drawn"
    t.integer  "goals_for"
    t.integer  "goals_against"
    t.text     "achievements",  :limit => 225
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "clubs", ["league_id"], :name => "index_clubs_on_league_id"

  create_table "expenses", :force => true do |t|
    t.integer  "admin_user_id",               :null => false
    t.string   "category",                    :null => false
    t.text     "description"
    t.string   "supplier",      :limit => 30, :null => false
    t.decimal  "amount",                      :null => false
    t.date     "purchase_date"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "expenses", ["admin_user_id"], :name => "index_expenses_on_admin_user_id"

  create_table "fixtures", :force => true do |t|
    t.integer  "league_id",  :null => false
    t.string   "location"
    t.datetime "date"
    t.string   "home_team"
    t.string   "away_team"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "team_id"
  end

  add_index "fixtures", ["league_id"], :name => "index_fixtures_on_league_id"
  add_index "fixtures", ["team_id"], :name => "index_fixtures_on_team_id"

  create_table "leagues", :force => true do |t|
    t.string   "title",      :limit => 50
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "club_name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "logo"
  end

  create_table "managers", :force => true do |t|
    t.integer  "team_id",                    :null => false
    t.string   "first_name",   :limit => 25
    t.string   "last_name",    :limit => 25
    t.string   "email",                      :null => false
    t.integer  "phone"
    t.text     "description"
    t.text     "achievements"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "image_url"
  end

  create_table "players", :force => true do |t|
    t.integer  "team_id",                    :null => false
    t.string   "first_name",   :limit => 25
    t.string   "last_name",    :limit => 25
    t.date     "dob"
    t.string   "position"
    t.integer  "squad_number", :limit => 2
    t.integer  "goals"
    t.integer  "played"
    t.integer  "red_cards"
    t.integer  "yellow_cards"
    t.text     "description"
    t.text     "achievements"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "image_url"
    t.integer  "phone"
    t.string   "email"
  end

  create_table "public_users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 25
    t.string   "email",           :limit => 55,                   :null => false
    t.string   "hashed_password", :limit => 64
    t.string   "username",        :limit => 25
    t.string   "salt",            :limit => 25
    t.integer  "phone"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "town"
    t.string   "county"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.boolean  "public_user",                   :default => true
  end

  create_table "results", :force => true do |t|
    t.integer  "league_id",  :null => false
    t.string   "location"
    t.datetime "date"
    t.string   "home_team"
    t.string   "away_team"
    t.integer  "home_score"
    t.integer  "away_score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "team_id"
  end

  add_index "results", ["league_id"], :name => "index_results_on_league_id"
  add_index "results", ["team_id"], :name => "index_results_on_team_id"

  create_table "sponsors", :force => true do |t|
    t.string   "company_name",               :null => false
    t.string   "location"
    t.string   "first_name",   :limit => 25
    t.string   "last_name",    :limit => 25
    t.string   "title",        :limit => 25
    t.string   "email",        :limit => 55, :null => false
    t.integer  "phone",                      :null => false
    t.string   "package",                    :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "teams", :force => true do |t|
    t.integer  "league_id",     :null => false
    t.string   "name"
    t.integer  "played"
    t.integer  "won"
    t.integer  "lost"
    t.integer  "drawn"
    t.integer  "goals_for"
    t.integer  "goals_against"
    t.text     "achievements"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "training_sessions", :force => true do |t|
    t.integer  "team_id",    :null => false
    t.datetime "date"
    t.string   "location"
    t.string   "coach"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "training_sessions", ["team_id"], :name => "index_training_sessions_on_team_id"

end
