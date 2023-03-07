class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages


  def self.tests_by_category(category_name)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
