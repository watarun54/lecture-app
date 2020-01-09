class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show]

  def index
    @lectures = Lecture.all
  end

  def show
    @reviews = @lecture.reviews
    @average_rate = @reviews.present? ? (@reviews.pluck(:rate).sum / @reviews.size.to_f).round(1) : "None"
  end

  def search
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end
end
