module BadgeSpecifications
  class AllByCategorySpecification < AbstractRuleSpecification
    def satisfies?
      return false if @badge.rule_type != 'all_by_category'
      title = @badge.rule_value

      Test.where(id: passed_ids).by_category(title).count == Test.by_category(title).count
    end
  end
end
