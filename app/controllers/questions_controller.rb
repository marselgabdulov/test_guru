class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new]
  before_action :find_question, only: [:show]

  def index
    render inline: "<ul><% @test.questions.each do |question| %><li><%= question.body %></li><% end %></ul>"
  end

  def show
    render inline: "<p><%= @question.body %></p>"
  end

  def new; end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
