class Dog < ApplicationRecord
  def avg_weight
    ((min_weight + max_weight) / 2).round
  end
end
