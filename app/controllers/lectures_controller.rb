class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show]

  def index
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
