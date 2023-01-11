class AddTopBreedToResult < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :top_breed_id, :integer
  end
end
