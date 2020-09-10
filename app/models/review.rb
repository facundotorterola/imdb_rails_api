class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :title, presence: true
  validates :description, presence: true
  validates :rate, presence: true
  validates :user_id, presence: true
  validates :movie_id, presence: true

end
