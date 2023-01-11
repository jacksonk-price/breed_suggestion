class AddSecondAndThirdBreedToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :second_breed_id, :integer
    add_column :results, :third_breed_id, :integer
    rename_column :results, :top_breed_id, :first_breed_id
  end
end
