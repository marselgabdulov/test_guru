class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    @result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if @result.success?
                      Gist.create(gist_params)
                      { notice: t(".success") + view_context.link_to(" gist.github.com", @result.url) }
                    else
                      { alert: t(".failure") }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_params
    { question: @test_passage.current_question, user: current_user, url: @result.url }
  end
end
