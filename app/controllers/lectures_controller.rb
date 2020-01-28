class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show]

  def index
    @lectures = Lecture.all.page(params[:page]).per(LECTURES_PER)
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
    render :index
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end
end
