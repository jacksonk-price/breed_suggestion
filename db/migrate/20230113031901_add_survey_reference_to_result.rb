class AddSurveyReferenceToResult < ActiveRecord::Migration[7.0]
  def change
    add_reference :results, :surveys, type: :string, foreign_key: true
  end
end
