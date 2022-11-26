class GistQuestionService
  attr_reader :client

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
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
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
    content = [@question.title]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end
end
