class GistQuestionService
  Result = Struct.new(:service_result) do
    delegate :url, to: :service_result, allow_nil: true

    def success?
      service_result&.url.present?
    end
  end
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    Result.new(@client.create_gist(gist_params.to_json))
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end

  def gist_params
    {
      description: I18n.t('description', test_title: @test.title),
      files: {
        'test_guru_question.txt' => {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    [@question.title, *@question.answers.pluck(:title)].join("\n")
  end
end
