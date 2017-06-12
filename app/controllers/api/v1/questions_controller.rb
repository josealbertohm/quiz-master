class Api::V1::QuestionsController < Api::V1::ApplicationController
  def show
    @quiz = Question.select("id, content").order("RANDOM()").limit(10)
    render json: @quiz
  end
end
