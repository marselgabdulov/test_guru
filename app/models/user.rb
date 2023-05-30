class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authorized_tests, class_name: "Test", foreign_key: :author_id

  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP

  def user_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
