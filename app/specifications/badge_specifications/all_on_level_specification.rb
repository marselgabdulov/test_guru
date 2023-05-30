module BadgeSpecifications
  class AllOnLevelSpecification < AbstractRuleSpecification
    def satisfies?
      return false if @badge.rule_type != 'all_on_level'

      level = @badge.rule_value.to_i
      puts level
      Test.where(level: level, id: passed_ids).count == Test.where(level: level).count
    end
  end
end
