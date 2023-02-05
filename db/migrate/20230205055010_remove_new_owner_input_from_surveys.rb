class RemoveNewOwnerInputFromSurveys < ActiveRecord::Migration[7.0]
  def change
    remove_column :surveys, :new_owner_input, :string
  end
end
