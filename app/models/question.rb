class Question < ApplicationRecord
  has_many :question_answer_choices
  has_many :answer_choices, through: :question_answer_choices
end
