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

ActiveRecord::Schema.define(version: 2020_07_06_182637) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.bigint "doctor_profile_id"
    t.bigint "patient_profile_id"
    t.time "time_from"
    t.time "time_to"
    t.text "description"
    t.string "status"
    t.boolean "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_profile_id"], name: "index_appointments_on_doctor_profile_id"
    t.index ["patient_profile_id"], name: "index_appointments_on_patient_profile_id"
  end

  create_table "clinics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.index ["address_id"], name: "index_clinics_on_address_id"
  end

  create_table "clinics_doctor_profiles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "doctor_profile_id", null: false
    t.index ["clinic_id", "doctor_profile_id"], name: "index_clinics_doctor_profiles", unique: true
  end

  create_table "day_of_weeks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "day"
  end

  create_table "doctor_leaves", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "leave_date"
    t.bigint "doctor_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_profile_id"], name: "index_doctor_leaves_on_doctor_profile_id"
  end

  create_table "doctor_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "gender"
    t.integer "years_of_experiance"
    t.string "register_number"
    t.integer "consultation_fee"
    t.integer "slot_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.bigint "specialisation_id"
    t.bigint "user_id"
    t.index ["address_id"], name: "index_doctor_profiles_on_address_id"
    t.index ["specialisation_id"], name: "index_doctor_profiles_on_specialisation_id"
    t.index ["user_id"], name: "index_doctor_profiles_on_user_id"
  end

  create_table "doctor_week_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "status"
    t.bigint "day_of_week_id"
    t.bigint "doctor_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_of_week_id"], name: "index_doctor_week_plans_on_day_of_week_id"
    t.index ["doctor_profile_id"], name: "index_doctor_week_plans_on_doctor_profile_id"
  end

  create_table "patient_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "gender"
    t.string "blood_group"
    t.datetime "dob"
    t.integer "height"
    t.integer "weight"
    t.bigint "address_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_patient_profiles_on_address_id"
    t.index ["user_id"], name: "index_patient_profiles_on_user_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "slots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.boolean "status"
    t.bigint "doctor_profile_id"
    t.bigint "day_of_week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_of_week_id"], name: "index_slots_on_day_of_week_id"
    t.index ["doctor_profile_id"], name: "index_slots_on_doctor_profile_id"
  end

  create_table "specialisations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "specialisation"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.text "authentication_token"
    t.datetime "authentication_token_created_at"
    t.bigint "user_category_id"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "phone_number"
    t.boolean "active"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, length: 5
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name", unique: true
    t.index ["last_name"], name: "index_users_on_last_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_category_id"], name: "index_users_on_user_category_id"
  end

  add_foreign_key "appointments", "doctor_profiles"
  add_foreign_key "appointments", "patient_profiles"
  add_foreign_key "clinics", "addresses"
  add_foreign_key "doctor_leaves", "doctor_profiles"
  add_foreign_key "doctor_profiles", "addresses"
  add_foreign_key "doctor_profiles", "specialisations"
  add_foreign_key "doctor_profiles", "users"
  add_foreign_key "doctor_week_plans", "day_of_weeks"
  add_foreign_key "doctor_week_plans", "doctor_profiles"
  add_foreign_key "patient_profiles", "addresses"
  add_foreign_key "patient_profiles", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "slots", "day_of_weeks"
  add_foreign_key "slots", "doctor_profiles"
  add_foreign_key "users", "user_types", column: "user_category_id"
end
