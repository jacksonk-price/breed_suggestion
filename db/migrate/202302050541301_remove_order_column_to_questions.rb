class RemoveOrderColumnToQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :display_order, :integer
  end
end
