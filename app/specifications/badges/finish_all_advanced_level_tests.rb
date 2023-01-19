module Badges
  class FinishAllAdvancedLevelTests < AbstractBadgeRuleSpecification
    ADVANCED_LEVEL = 2

    def initialize(*args)
      super
      @user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where({ level: ADVANCED_LEVEL })
    end

    def satisfies?
      (Test.advanced_level.ids.sort == @user_successfully_passed_tests_by_level.ids.sort) && (test_passage.test.level == ADVANCED_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
