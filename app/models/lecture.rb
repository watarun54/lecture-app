class Lecture < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :resemblances, dependent: :destroy

  scope :lectures_related_to, -> (lec) { where(id: lec.resemblances.pluck(:r_id)) }
end
