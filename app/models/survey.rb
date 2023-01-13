class Survey < ApplicationRecord
  # validates :name_input, :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input, :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input, :trainability_input, :energy_input, :barking_input, :mental_stim_input, presence: true
  has_one :result
  after_create :create_result
  after_destroy :destroy_associations

  def create_result
    breeds = Dog.filter(self)
    breeds.each do |b|
      Rails.logger.info b.name.to_s
    end
    Result.create!(breed_id: breeds.sample.id, survey_id: id)
  end

  private

  def destroy_associations
    result.destroy
  end

  def self.generate_uuid
    uuid = SecureRandom.uuid
    Rails.logger.info 'Generated UUID'
    Rails.logger.info uuid.to_s
    uuid
  end
end


