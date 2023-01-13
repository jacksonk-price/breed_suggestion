class FixSurveysIdName < ActiveRecord::Migration[7.0]
  def change
    rename_column :results, :surveys_id, :survey_id
  end
end
