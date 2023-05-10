class Badge < ApplicationRecord
  BADGES_TYPES = %i[first_time all_by_level all_of_category].freeze
  has_many :appointments
  has_many :user, through: :appointments

  validates :name, :image_url, :rule_type, :rule_value, presence: true
  validates :name, uniqueness: true
end
