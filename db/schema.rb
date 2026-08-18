# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2024_02_27_100417) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "eligibility_checks", force: :cascade do |t|
    t.boolean "complained"
    t.string "complaint_status"
    t.string "continue_with"
    t.datetime "created_at", null: false
    t.string "is_teacher"
    t.string "reporting_as", null: false
    t.string "serious_misconduct"
    t.string "teaching_in_england"
    t.string "unsupervised_teaching"
    t.datetime "updated_at", null: false
  end

  create_table "feature_flags_features", force: :cascade do |t|
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_feature_flags_features_on_name", unique: true
  end

  create_table "feedbacks", force: :cascade do |t|
    t.boolean "contact_permission_given", null: false
    t.datetime "created_at", null: false
    t.string "email"
    t.text "improvement_suggestion", null: false
    t.string "satisfaction_rating", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.string "city"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "postcode"
    t.bigint "referral_id", null: false
    t.string "street_1"
    t.string "street_2"
    t.datetime "updated_at", null: false
    t.index ["referral_id"], name: "index_organisations_on_referral_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.boolean "address_known"
    t.string "address_line_1"
    t.string "address_line_2"
    t.boolean "age_known"
    t.text "allegation_consideration_details"
    t.text "allegation_details"
    t.boolean "allegation_details_complete"
    t.string "allegation_format"
    t.boolean "contact_details_complete"
    t.string "country"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.boolean "dbs_notified"
    t.text "declaration"
    t.text "duties_details"
    t.string "duties_format"
    t.bigint "eligibility_check_id"
    t.string "email_address", limit: 256
    t.boolean "email_known"
    t.string "employment_status"
    t.boolean "evidence_details_complete"
    t.string "first_name"
    t.boolean "has_evidence"
    t.string "has_qts"
    t.string "job_title"
    t.string "last_name"
    t.string "name_has_changed"
    t.string "ni_number"
    t.boolean "ni_number_known"
    t.boolean "organisation_address_known"
    t.string "organisation_address_line_1"
    t.string "organisation_address_line_2"
    t.string "organisation_name"
    t.string "organisation_postcode", limit: 11
    t.string "organisation_town_or_city"
    t.boolean "personal_details_complete"
    t.boolean "phone_known"
    t.string "phone_number"
    t.string "postcode", limit: 11
    t.boolean "previous_misconduct_complete"
    t.text "previous_misconduct_details"
    t.string "previous_misconduct_format"
    t.string "previous_misconduct_reported"
    t.string "previous_name"
    t.string "reason_leaving_role"
    t.date "role_end_date"
    t.boolean "role_end_date_known"
    t.date "role_start_date"
    t.boolean "role_start_date_known"
    t.boolean "same_organisation"
    t.datetime "submitted_at", precision: nil
    t.boolean "teacher_role_complete"
    t.string "town_or_city"
    t.string "trn"
    t.boolean "trn_known"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "work_address_line_1"
    t.string "work_address_line_2"
    t.boolean "work_location_known"
    t.string "work_organisation_name"
    t.string "work_postcode"
    t.string "work_town_or_city"
    t.string "working_somewhere_else"
    t.index ["eligibility_check_id"], name: "index_referrals_on_eligibility_check_id"
    t.index ["user_id"], name: "index_referrals_on_user_id"
  end

  create_table "referrers", force: :cascade do |t|
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.string "first_name"
    t.string "job_title"
    t.string "last_name"
    t.string "phone"
    t.bigint "referral_id", null: false
    t.datetime "updated_at", null: false
    t.index ["referral_id"], name: "index_referrers_on_referral_id"
  end

  create_table "reminder_emails", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "referral_id", null: false
    t.datetime "updated_at", null: false
    t.index ["referral_id"], name: "index_reminder_emails_on_referral_id"
  end

  create_table "staff", force: :cascade do |t|
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.datetime "deleted_at", precision: nil
    t.boolean "developer", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.boolean "feedback_notification", default: false
    t.datetime "invitation_accepted_at"
    t.datetime "invitation_created_at"
    t.integer "invitation_limit"
    t.datetime "invitation_sent_at"
    t.string "invitation_token"
    t.integer "invitations_count", default: 0
    t.bigint "invited_by_id"
    t.string "invited_by_type"
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "locked_at"
    t.boolean "manage_referrals", default: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.string "unconfirmed_email"
    t.string "unlock_token"
    t.datetime "updated_at", null: false
    t.boolean "view_support", default: false
    t.index ["confirmation_token"], name: "index_staff_on_confirmation_token", unique: true
    t.index ["email"], name: "index_staff_on_email", unique: true
    t.index ["invitation_token"], name: "index_staff_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_staff_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_staff_on_invited_by"
    t.index ["reset_password_token"], name: "index_staff_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_staff_on_unlock_token", unique: true
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "filename", default: "", null: false
    t.string "malware_scan_result", default: "pending", null: false
    t.string "section", null: false
    t.datetime "updated_at", null: false
    t.bigint "uploadable_id"
    t.string "uploadable_type"
    t.index ["uploadable_type", "uploadable_id"], name: "index_uploads_on_uploadable"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "otp_created_at", precision: nil
    t.integer "otp_guesses", default: 0
    t.datetime "remember_created_at"
    t.string "secret_key"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  create_table "validation_errors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "details"
    t.string "form_object"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "organisations", "referrals"
  add_foreign_key "referrals", "eligibility_checks"
  add_foreign_key "referrals", "users"
  add_foreign_key "referrers", "referrals"
  add_foreign_key "reminder_emails", "referrals"
end
