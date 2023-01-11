class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :name_input
      t.string :size_input
      t.integer :family_input
      t.integer :children_input
      t.integer :other_dog_input
      t.integer :shedding_input
      t.integer :grooming_input
      t.integer :drooling_input
      t.integer :stranger_input
      t.integer :playfulness_input
      t.integer :protective_input
      t.integer :adaptability_input
      t.integer :trainability_input
      t.integer :energy_input
      t.integer :barking_input
      t.integer :mental_stim_input

      t.timestamps
    end
  end
end
