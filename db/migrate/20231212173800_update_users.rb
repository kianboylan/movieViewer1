# frozen_string_literal: true

class UpdateUsers < ActiveRecord::Migration[7.1]
  def change
    @u = User.find_by(email: 'admin@email.ie')
    @u.update_attribute :admin, true
  end
end
