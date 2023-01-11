class RemoveDogReferenceFromSurvey < ActiveRecord::Migration[7.0]
  def change
    remove_column :results, :dog_id
  end
end
