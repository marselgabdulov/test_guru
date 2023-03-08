class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :easy,    -> { level(0..1) }
  scope :medium,  -> { level(2..4) }
  scope :hard,    -> { level(5..Float::INFINITY) }

  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }

  def self.tests_by_category(category_name)
    by_category(category_name)
      .order(title: :desc)
      .pluck(:title)
  end
end
