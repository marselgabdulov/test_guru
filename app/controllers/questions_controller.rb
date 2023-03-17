class QuestionsController < ApplicationController
  before_action :find_test

  def index
    render inline: "<ul><% @test.questions.each do |question| %><li><%= question.body %></li><% end %></ul>"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
