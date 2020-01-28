class Lecture < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :resemblances, dependent: :destroy

  scope :lectures_related_to, -> (lec) { where(id: lec.resemblances.pluck(:r_id)) }

  def self.search(keywords)
    return Lecture.all if keywords.empty?
    lecture_ids = keywords.map { |keyword|
                Lecture.where([
                  'title LIKE ? OR content LIKE ?',
                  "%#{keyword}%", "%#{keyword}%"
                ]).pluck(:id)
              }.flatten.uniq
    Lecture.where(id: lecture_ids)
  end
end
