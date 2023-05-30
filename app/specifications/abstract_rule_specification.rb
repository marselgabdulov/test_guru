class AbstractRuleSpecification
  def initialize(badge:, test_passage:)
    @badge = badge
    @test_passage = test_passage
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end

  private

  def passed_ids
    @test_passage.user.test_passages.where(passed: true).pluck(:test_id).uniq
  end
end
