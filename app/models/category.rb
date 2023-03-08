class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validate :title, presence: true

  default_scope { order(title: :asc) }
end
