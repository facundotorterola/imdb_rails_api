class MovieSerializer < ActiveModel::Serializer
    attributes :id,:title,:director,:year,:description,:rating
    has_many :reviews

    def rating
        rating = object.reviews.average(:rate)
        if rating
            rating
        else
            0
        end 
    end
end