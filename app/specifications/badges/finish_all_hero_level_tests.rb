module Badges
  class FinishAllHeroLevelTests < AbstractBadgeRuleSpecification
    HERO_LEVEL = 4

    def initialize(*args)
      super
      @user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where({ level: HERO_LEVEL })
    end

    def satisfies?
      (Test.hero_level.ids.sort == @user_successfully_passed_tests_by_level.ids.sort) && (test_passage.test.level >= HERO_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
