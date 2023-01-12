class Survey < ApplicationRecord
  validates :name_input, :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input, :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input, :trainability_input, :energy_input, :barking_input, :mental_stim_input, presence: true
  has_one :result
  after_create :create_result
  after_destroy :destroy_associations

  def create_result
    breeds = Dog.filter(self)
    Rails.logger.info '8'* 15
    breeds.each do |b|
      Rails.logger.info b.name.to_s
    end
    first_breed = breeds.first
    second_breed = breeds[1]
    third_breed = breeds[2]
    Result.create!(first_breed_id: first_breed.id, second_breed_id: second_breed.id, third_breed_id: third_breed.id, survey_id: id)
  end

  private

  def destroy_associations
    result.destroy
  end
end


