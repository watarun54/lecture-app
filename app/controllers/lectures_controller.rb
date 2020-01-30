class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show]

  include ReviewsHelper

  def index
    @lectures = Lecture.all.page(params[:page]).per(LECTURES_PER)

    @lectures_by_rate, @lectures_by_reviews = rank_data
  end

  def show
    @reviews = @lecture.reviews
  end

  def search
    @search_params = params[:search]
    @query = @search_params.split(/[[:blank:]]+/).reject(&:blank?)

    if @query.present?
      @lectures = Lecture.search(@query)
    else
      return redirect_to root_path
    end

    @lectures = @lectures.page(params[:page]).per(LECTURES_PER)
    @result_count = @lectures.total_count

    @lectures_by_rate, @lectures_by_reviews = rank_data
    render :index
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def rank_data
    d = Lecture.all.includes(:reviews).map do |lec|
      next if lec.reviews.empty?
      [lec, average_rate(lec.reviews), lec.reviews.size]
    end.compact
    lectures_by_rate = d.sort_by{|x| -x[1]}
    lectures_by_reviews = d.sort_by{|x| -x[2]}
    return lectures_by_rate, lectures_by_reviews
  end
end
