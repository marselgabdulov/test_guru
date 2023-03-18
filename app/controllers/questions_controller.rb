class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<ul><% @test.questions.each do |question| %><li><%= question.body %></li><% end %></ul>"
  end

  def show
    render inline: "<p><%= @question.body %></p>"
  end

  def new; end

  def create
    @question = @test.questions.new question_params

    if @question.save
      redirect_to @question
    else
      render "new"
    end
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Вопрос не был найден"
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
