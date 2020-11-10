# frozen_string_literal: true

class ReviewSerializer < ActiveModel::Serializer
  attributes :author, :title, :description, :rate

  def author
    "#{object.user.first_name} #{object.user.last_name}"
  end
end
