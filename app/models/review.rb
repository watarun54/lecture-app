class Review < ApplicationRecord
  belongs_to :lecture

  scope :newest, -> { order(created_at: :desc) }
end
