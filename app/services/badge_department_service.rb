class BadgeDepartmentService
  attr_reader :user, :passing_test, :user_successfully_passed_tests

  RULES = { pass_all_frontend_tests: Badges::FinishAllFrontendTests,
            pass_all_backend_tests: Badges::FinishAllBackendTests,
            pass_all_machine_learning_tests: Badges::FinishAllMachineLearningTests,
            pass_test_on_first_try: Badges::FinishTestOnFirstTry,
            pass_all_easy_level_tests: Badges::FinishAllEasyLevelTests,
            pass_all_elementary_level_tests: Badges::FinishAllElementaryLevelTests,
            pass_all_advanced_level_tests: Badges::FinishAllAdvancedLevelTests,
            pass_all_hard_level_tests: Badges::FinishAllHardLevelTests,
            pass_all_hero_level_tests: Badges::FinishAllHeroLevelTests }.freeze

  def initialize(user, passing_test)
    @user = user
    @passing_test = passing_test
    @user_successfully_passed_tests = []

    set_user_successfully_passed_tests
  end

  def call
    received_badges = Badge.select do |badge|
      rule = RULES[badge.rule.rule_type.to_sym].new(@user, @passing_test, @user_successfully_passed_tests, badge)
      rule.satisfies?
    end

    user.badges.push(received_badges)
    received_badges
  end

  private

  def set_user_successfully_passed_tests
    user_successfully_passed_tests_ids = user.test_passages.where(sucessfully_passed: true).pluck(:test_id)
    user_successfully_passed_tests_ids.each { |id| user_successfully_passed_tests << Test.find(id) }
  end
end
