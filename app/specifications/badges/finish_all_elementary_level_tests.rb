module Badges
  class FinishAllElementaryLevelTests < AbstractBadgeRuleSpecification
    ELEMENTARY_LEVEL = 1

    def initialize(*args)
      super
      @user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where({ level: ELEMENTARY_LEVEL })
    end

    def satisfies?
      (Test.elementary_level.ids.sort == @user_successfully_passed_tests_by_level.ids.sort) && (test_passage.test.level == ELEMENTARY_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
