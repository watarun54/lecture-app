class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show]

  def index
    @lectures = Lecture.all
  end

  def show
  end

  def search
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end
end
