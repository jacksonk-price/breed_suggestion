class QuestionAnswerChoice < ApplicationRecord
  belongs_to :question
  belongs_to :answer_choice
end


