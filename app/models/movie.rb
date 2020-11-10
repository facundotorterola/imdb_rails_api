# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews
  validates :title, presence: true
  validates :director, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1920, less_than_or_equal_to: 2020 }
end
