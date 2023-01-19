module Badges
  class FinishTestOnFirstTry < AbstractBadgeRuleSpecification
    def satisfies?
      (test_passage.successfully_passed?) && (user.test_passages.map(&:test).count(test_passage.test) == 1)
    end
  end
end
