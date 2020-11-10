# frozen_string_literal: true

class AddPasswordToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password, :string
  end
end
