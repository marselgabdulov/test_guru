# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
admin = Admin.new(first_name: "John", last_name: "Weak", email: "admin@testguru.com", password: "secret")
# admin.skip_confirmation!
admin.save!

user = User.new(first_name: "Max", last_name: "Mad", email: "user@testguru.com", password: "secret")

# user.skip_confirmation!
user.save!

# Categories
frontend_category = Category.create!(title: "Frontend")
backend_category = Category.create!(title: "Backend")
common_category = Category.create!(title: "Common")

# Tests
tests = Test.create!([
                       { title: "Redux", level: 3, category_id: frontend_category.id, author: admin },
                       { title: "Active Record", level: 2, category_id: backend_category.id, author: admin },
                       { title: "HTTP", level: 1, category_id: common_category.id, author: admin }
                      ])

# Questions and TestPassage
tests.each do |test|
  Question.create!([
                    { body: "First question", test: test },
                    { body: "Second question", test: test },
                    { body: "Third question", test: test }
                  ])
  TestPassage.create!(test: test, user: user)
end

# Answers
Question.all.each do |question|
  Answer.create!([
                   { body: "First answer", question_id: question.id, correct: true },
                   { body: "Second answer", question_id: question.id },
                   { body: "Third answer", question_id: question.id }
                 ])
end
