class MovieSerializer < ActiveModel::Serializer
    attributes :id,:title,:director,:year,:description
    has_many :reviews
end