# frozen_string_literal: true

class AddAdminToUsers < ActiveRecord::Migration[7.1] # rubocop:todo Style/Documentation
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
