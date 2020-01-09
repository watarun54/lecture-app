class ReviewsController < ApplicationController
  def new
    @lecture = Lecture.find(params[:lecture_id])
    @review = Review.new
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @review = @lecture.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @lecture, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :good_point, :bad_point, :lecture_id)
  end
end
