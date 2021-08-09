class AddUserToReports < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :user, foregin_key: true
    add_index :reports,[:user_id, :created_at]
  end
end
