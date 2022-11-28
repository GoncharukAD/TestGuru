class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params) #create_gist метод из Oktokit
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
    }
  end

  def gist_content
    [@question.title, *@question.answers.pluck(:title)].join("\n")
  end
end
