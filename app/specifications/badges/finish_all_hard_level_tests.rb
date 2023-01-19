module Badges
  class FinishAllHardLevelTests < AbstractBadgeRuleSpecification
    HARD_LEVEL = 3

    def initialize(*args)
      super
      @user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where({ level: HARD_LEVEL })
    end

    def satisfies?
      (Test.hard_level.ids.sort == @user_successfully_passed_tests_by_level.ids.sort) && (test_passage.test.level == HARD_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
