class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table(:issues, options: 'DEFAULT CHARSET=utf8') do |t|
      t.integer  :assignee_id
      t.integer  :jira_issue_id, limit: 8
      t.string   :jira_issue_key
      t.string   :jira_issue_summary
      t.string   :jira_issue_parent_summary
      t.string   :jira_issue_status
      t.string   :jira_issue_detail_status
      t.integer  :assigner_id

      t.timestamps
    end

    add_index :issues, :assignee_id
    add_index :issues, :jira_issue_id
  end
end
