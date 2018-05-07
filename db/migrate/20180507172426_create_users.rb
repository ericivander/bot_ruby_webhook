class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table(:users, options: 'DEFAULT CHARSET=utf8') do |t|
      t.string  :telegram_username
      t.integer :telegram_user_id, limit: 8
      t.string  :jira_user_key
      t.string  :jira_user_email

      t.timestamps
    end

    add_index :users, :jira_user_email
    add_index :users, :telegram_user_id
    add_index :users, :created_at
    add_index :users, :updated_at
  end
end
