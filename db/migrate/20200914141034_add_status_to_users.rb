# frozen_string_literal: true

class AddStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status, :string, default: 'user'
  end
end
