class AnswerChoice < ApplicationRecord
  has_many :question_answer_choices
  has_many :questions, through: :question_answer_choices
end
