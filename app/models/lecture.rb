class Lecture < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :resemblances, dependent: :destroy
end
