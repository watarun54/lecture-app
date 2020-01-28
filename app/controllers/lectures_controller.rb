class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show]

  def index
    @lectures = Lecture.all.page(params[:page]).per(LECTURES_PER)
  end

  def show
    @reviews = @lecture.reviews
  end

  def search
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end
end
