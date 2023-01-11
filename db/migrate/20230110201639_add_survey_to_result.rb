class AddSurveyToResult < ActiveRecord::Migration[7.0]
  def change
    add_reference :results, :survey, null: false, foreign_key: true
  end
end
