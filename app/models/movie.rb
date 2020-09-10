class Movie < ApplicationRecord
    has_many :reviews
    validates :title, presence: true
    validates :director, presence: true
    validates :year, presence: true

end
