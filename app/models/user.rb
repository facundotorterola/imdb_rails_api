# frozen_string_literal: true

require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true
  before_create :hash_password

  # esto se ejecuta antes que User.new
  def hash_password
    @password = Password.create(password)
    self.password = @password
  end
end
