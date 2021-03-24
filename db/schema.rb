# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_21_143637) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "card_token", null: false
    t.string "customer_token", null: false
    t.bigint "parent_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_user_id"], name: "index_cards_on_parent_user_id"
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "group_id", null: false
    t.string "last_name_c_j", null: false
    t.string "first_name_c_j", null: false
    t.string "last_name_c_k", null: false
    t.string "first_name_c_k", null: false
    t.bigint "parent_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_user_id"], name: "index_contacts_on_parent_user_id"
  end

  create_table "parent_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "attendance_id", null: false
    t.integer "body_temperature_id", null: false
    t.integer "pick_up_time_id", null: false
    t.integer "pick_up_person_id", null: false
    t.text "parent_comment", null: false
    t.bigint "parent_user_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_parent_messages_on_contact_id"
    t.index ["parent_user_id"], name: "index_parent_messages_on_parent_user_id"
  end

  create_table "parent_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "phone_number", null: false
    t.string "last_name_p_j", null: false
    t.string "first_name_p_j", null: false
    t.string "last_name_p_k", null: false
    t.string "first_name_p_k", null: false
    t.integer "group_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_parent_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parent_users_on_reset_password_token", unique: true
  end

  create_table "service_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_service_orders_on_service_id"
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "service_type_id", null: false
    t.integer "unit_price_id", null: false
    t.integer "number_of_times", null: false
    t.text "teacher_comment", null: false
    t.bigint "teacher_user_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_services_on_contact_id"
    t.index ["teacher_user_id"], name: "index_services_on_teacher_user_id"
  end

  create_table "teacher_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "physical_condition_id", null: false
    t.integer "school_lunch_id", null: false
    t.integer "defecation_id", null: false
    t.text "teacher_comment", null: false
    t.bigint "teacher_user_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_teacher_messages_on_contact_id"
    t.index ["teacher_user_id"], name: "index_teacher_messages_on_teacher_user_id"
  end

  create_table "teacher_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "last_name_t_j", null: false
    t.string "first_name_t_j", null: false
    t.string "last_name_t_k", null: false
    t.string "first_name_t_k", null: false
    t.integer "group_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_teacher_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teacher_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cards", "parent_users"
  add_foreign_key "contacts", "parent_users"
  add_foreign_key "parent_messages", "contacts"
  add_foreign_key "parent_messages", "parent_users"
  add_foreign_key "service_orders", "services"
  add_foreign_key "services", "contacts"
  add_foreign_key "services", "teacher_users"
  add_foreign_key "teacher_messages", "contacts"
  add_foreign_key "teacher_messages", "teacher_users"
end
