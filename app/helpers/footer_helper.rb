# frozen_string_literal: true

module FooterHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to t("helpers.application_helper.repo"), "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
