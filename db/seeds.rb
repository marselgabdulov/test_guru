# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
admin = User.create!(name: "TestGuru", email: "test-guru@testguru.com", role: "admin")
user = User.create!(name: "Max", email: "max911@gmail.com", role: "user")

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

# Questions and Results
tests.each do |test|
  @questions = Question.create!([
                                  { body: "First question", test: test },
                                  { body: "Second question", test: test },
                                  { body: "Third question", test: test }
                                ])
  TestPassage.create!(test: test, user: user)
end

# Answers
@questions.each do |question|
  Answer.create!([
                   { body: "First answer", question: question, correct: true },
                   { body: "Second answer", question: question },
                   { body: "Third answer", question: question }
                 ])
end
