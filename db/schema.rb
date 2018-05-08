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

ActiveRecord::Schema.define(version: 2018_05_07_172953) do

  create_table "issues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "assignee_id"
    t.bigint "jira_issue_id"
    t.string "jira_issue_key"
    t.string "jira_issue_summary"
    t.string "jira_issue_parent_summary"
    t.string "jira_issue_status"
    t.string "jira_issue_detail_status"
    t.integer "assigner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_issues_on_assignee_id"
    t.index ["jira_issue_id"], name: "index_issues_on_jira_issue_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "telegram_username"
    t.bigint "telegram_user_id"
    t.string "jira_user_key"
    t.string "jira_user_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["jira_user_email"], name: "index_users_on_jira_user_email"
    t.index ["telegram_user_id"], name: "index_users_on_telegram_user_id"
    t.index ["telegram_username"], name: "index_users_on_telegram_username"
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

end
