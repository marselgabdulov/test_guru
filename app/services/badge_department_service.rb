class BadgeDepartmentService
  RULES = {
    first_try: BadgeSpecifications::FirstTrySpecification,
    all_by_category: BadgeSpecifications::AllByCategorySpecification,
    all_on_level: BadgeSpecifications::AllOnLevelSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(badge: badge, test_passage: @test_passage)

      add_badge(badge) if rule.satisfies?
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges.push(badge)
  end
end
