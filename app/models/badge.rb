class Badge < ApplicationRecord
  BADGE_TYPES = [:first_try, :all_by_category, :all_on_level].freeze

  has_many :user_badges
  has_many :user, through: :user_badges

  validates :name, :image_url, :rule_type, presence: true
  validates :name, uniqueness: true
end
