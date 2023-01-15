class AddNewOwnerInputToSurvey < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :new_owner_input, :string
  end
end
