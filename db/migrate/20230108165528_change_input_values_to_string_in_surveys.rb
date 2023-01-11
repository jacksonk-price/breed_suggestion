class ChangeInputValuesToStringInSurveys < ActiveRecord::Migration[7.0]
  def change
    change_column :surveys, :family_input, :string
    change_column :surveys, :children_input, :string
    change_column :surveys, :other_dog_input, :string
    change_column :surveys, :shedding_input, :string
    change_column :surveys, :grooming_input, :string
    change_column :surveys, :drooling_input, :string
    change_column :surveys, :stranger_input, :string
    change_column :surveys, :playfulness_input, :string
    change_column :surveys, :protective_input, :string
    change_column :surveys, :adaptability_input, :string
    change_column :surveys, :trainability_input, :string
    change_column :surveys, :energy_input, :string
    change_column :surveys, :barking_input, :string
    change_column :surveys, :mental_stim_input, :string
  end
end
