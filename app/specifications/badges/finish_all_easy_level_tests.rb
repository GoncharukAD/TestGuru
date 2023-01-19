module Badges
  class FinishAllEasyLevelTests < AbstractBadgeRuleSpecification
    EASY_LEVEL = 0

    def initialize(*args)
      super
      @user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where({ level: EASY_LEVEL })
    end

    def satisfies?
      (Test.easy_level.ids.sort == @user_successfully_passed_tests_by_level.ids.sort) && (test_passage.test.level == EASY_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
