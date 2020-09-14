class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :title, presence: true
  validates :description, presence: true
  validates :rate, presence: true, numericality: { only_integer: true ,greater_than: 0 ,  less_than_or_equal_to: 10}
  validates :user_id, presence: true
  validates :movie_id, presence: true
  

end
