# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :director, :year, :description, :rating
  has_many :reviews

  def rating
    rating = object.reviews.average(:rate)
    rating || 0
  end
end
