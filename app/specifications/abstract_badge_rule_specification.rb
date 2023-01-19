class AbstractBadgeRuleSpecification
  attr_reader :user, :test_passage, :user_successfully_passed_tests, :current_badge

  def initialize(user, test_passage, user_successfully_passed_tests, badge)
    @user = user
    @test_passage = test_passage
    @user_successfully_passed_tests = user_successfully_passed_tests
    @current_badge = badge
  end

  protected

  def user_contain_current_badge?
    user.badges.ids.include?(current_badge.id)
  end
end
