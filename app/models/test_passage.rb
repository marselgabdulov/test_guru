class TestPassage < ApplicationRecord
  PASS_SCORE = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true, foreign_key: 'question_id'

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def result_percentage
    (correct_questions / test.questions.count.to_f * 100).round(2)
  end

  def test_pass?
    result_percentage >= PASS_SCORE
  end

  def mark_as_passed
    update(passed: true) if test_pass?
  end

  def question_index_number
    test.questions.index(current_question) + 1
  end

  def number_of_questions
    test.questions.count
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end

  def correct_answer?(answer_ids)
    answer_ids = [] if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
