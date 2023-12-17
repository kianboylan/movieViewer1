# frozen_string_literal: true

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Save Movie Review" do
    user = users(:one)
    assert user.save
  end
end
