class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  GistUrl = Struct.new(:url) do
    def success?
      url.present?
    end
  end

  def call
    response = @client.create_gist(gist_params)

    return GistUrl.new unless @client.last_response.status == 201

    GistUrl.new(response.html_url)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch("GITHUB_API_TOKEN"))
  end

  def gist_params
    {
      description: I18n.t("services.description", test_title: @test.title),
      files: {
        "test-guru-question.txt" => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
