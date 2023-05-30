module BadgeSpecifications
  class FirstTrySpecification < AbstractRuleSpecification
    def satisfies?
      return false if @badge.rule_type != 'first_try'

      number_of_tries = TestPassage.where(test: @test_passage.test, user: @test_passage.user)
      number_of_tries.count == 1 && number_of_tries.first.passed?
    end
  end
end
