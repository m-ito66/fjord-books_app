# frozen_string_literal: true

class AddUserToReports < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :user, foregin_key: true
    add_index :reports, %i[user_id created_at]
  end
end
