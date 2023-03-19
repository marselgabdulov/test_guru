module QuestionsHelper
  def question_header(question)
    question.new_record? ? "Create new #{question.test.title} Question" : "Edit #{question.test.title} Question"
  end
end
