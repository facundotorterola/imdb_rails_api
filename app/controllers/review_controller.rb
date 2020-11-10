# frozen_string_literal: true

require 'byebug'

class ReviewController < ApplicationController
  include Secure
  before_action :authenticate_user!, only: %i[create update]

  def create
    params[:user_id] = Current.user.id
    review = Review.create!(create_params)
    render json: review, status: :created
  end

  def update
    review = Review.find(params[:id])
    if review.user_id == Current.user.id
      review.update!(update_params)
      render json: review, status: :created
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def create_params
    params.permit(:title, :user_id, :movie_id, :description, :rate)
  end

  def update_params
    params.permit(:title, :description, :rate)
  end
end
