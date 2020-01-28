module ReviewsHelper
  def average_rate(reviews)
    reviews.present? ? (reviews.pluck(:rate).sum / reviews.size.to_f).round(1) : "NA"
  end
end
