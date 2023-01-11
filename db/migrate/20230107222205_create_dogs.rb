class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.text :description
      t.integer :min_weight
      t.integer :max_weight
      t.integer :family_score
      t.integer :children_score
      t.integer :other_dog_score
      t.integer :shedding_score
      t.integer :grooming_score
      t.integer :drooling_score
      t.integer :stranger_score
      t.integer :playfulness_score
      t.integer :protective_score
      t.integer :adaptability_score
      t.integer :trainability_score
      t.integer :energy_score
      t.integer :barking_score
      t.integer :mental_stim_score

      t.timestamps
    end
  end
end
