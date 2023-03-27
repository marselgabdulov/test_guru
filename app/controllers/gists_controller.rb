class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:id])

    @result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if @result.success?
                      Gist.create!(gist_params)
                      { notice: t(".success") }

                    else
                      { alert: t(".failure") }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def gist_params
    { question: @test_passage.current_question, user: @test_passage.user, url: @result.url }
  end
end
