# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :genre, presence: true
  validates :description, presence: true
  validates :director, presence: true
  validates :release_date, presence: true
  validates :run_time, presence: true
  validates :production_company, presence: true
  validates :review, presence: true
end
