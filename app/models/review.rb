class Review < ApplicationRecord
  belongs_to :lecture

  validates :good_point, presence: true, length: { maximum: 400 }
  validates :bad_point, presence: true, length: { maximum: 400 }

  scope :newest, -> { order(created_at: :desc) }
end
