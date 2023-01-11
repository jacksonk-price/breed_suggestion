class Survey < ApplicationRecord
  validates :name_input, :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input, :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input, :trainability_input, :energy_input, :barking_input, :mental_stim_input, presence: true
  has_one :result
  after_destroy :destroy_associations
  after_create :create_result

  def create_result
    query = size_query + family_query + children_query + other_dog_query + shedding_query + grooming_query + drooling_query + stranger_query + playfulness_query + protective_query + adaptability_query + trainability_query + barking_query + energy_query + mental_stim_query
    returned_breeds = Dog.where(query)
    Rails.logger.info '-' * 15
    Rails.logger.info returned_breeds.count.to_s
    returned_breeds.each do |b|
      Rails.logger.info b.name.to_s
    end
    first_breed = returned_breeds.first
    second_breed = returned_breeds[1]
    third_breed = returned_breeds[2]
    Result.create!(first_breed_id: first_breed.id, second_breed_id: second_breed.id, third_breed_id: third_breed.id, survey_id: id)
  end

  def size_query
    # What size dog do you prefer?
    case size_input
    when 'small'
      size_query = 'max_weight < 22 '
    when 'medium'
      size_query = 'min_weight > 22 AND max_weight < 55 '
    when 'large'
      size_query = 'min_weight > 55 AND max_weight < 85 '
    when 'xl'
    size_query = 'max_weight > 85 '
    else
      Rails.logger.info "error in size case"
    end
    size_query
  end

  def family_query
    # Will your dog be around family members?
    case family_input
    when 'yes'
      family_query = 'AND family_score > 3 '
    when 'sometimes'
      family_query = 'AND family_score > 2 '
    when 'no'
      family_query = 'AND family_score > 0 AND family_score < 6 '
    else
      Rails.logger.info 'error in family case'
    end
    family_query
  end

  def children_query
    # Do you expect your dog to be around children?
    case children_input
    when 'yes', 'sometimes'
      children_query = 'AND children_score > 3 '
    when 'sometimes'
      children_query = 'AND children_score > 2 '
    when 'no'
      children_query = 'AND children_score > 0 AND children_score < 6 '
    else
      Rails.logger.info 'error in children case'
    end
    children_query
  end

  def other_dog_query
    # Do you expect your dog to be around other dogs (such as daycare or in your household)?
    case other_dog_input
    when 'yes', 'sometimes'
      other_dog_query = 'AND other_dog_score > 3 '
    when 'no'
      other_dog_query = 'AND other_dog_score > 0 AND other_dog_score < 6 '
    else
      Rails.logger.info 'error in other dog case'
    end
    other_dog_query
  end

  def shedding_query
    # Would a dog that sheds a lot bother you?
    case shedding_input
    when 'yes'
      shedding_query = 'AND shedding_score < 4 '
    when 'no', 'neutral'
      shedding_query = 'AND shedding_score > 0 AND shedding_score < 6 '
    else
      Rails.logger.info 'error in shedding case'
    end
    shedding_query
  end

  def grooming_query
    # Would a dog that requires a lot of grooming bother you?
    case grooming_input
    when 'yes'
      grooming_query = 'AND grooming_score < 4 '
    when 'no', 'neutral'
      grooming_query = 'AND grooming_score > 0 AND grooming_score < 6 '
    else
      Rails.logger.info 'error in grooming case'
    end
    grooming_query
  end

  def drooling_query
    # Would a dog that drools a lot bother you?
    case drooling_input
    when 'yes'
      drooling_query = 'AND drooling_score < 4 '
    when 'no', 'neutral'
      drooling_query = 'AND drooling_score > 0 AND drooling_score < 6 '
    else
      Rails.logger.info 'error in drooling case'
    end
    drooling_query
  end

  def stranger_query
    # Do you expect your dog to encounter strangers often?
    case stranger_input
    when 'yes', 'sometimes'
      stranger_query = 'AND stranger_score > 2 '
    when 'no'
      stranger_query = 'AND stranger_score > 0 AND stranger_score < 6 '
    else
      Rails.logger.info 'error in stranger case'
    end
    stranger_query
  end

  def playfulness_query
    # Do you prefer a dog that is very playful?
    case playfulness_input
    when 'yes'
      playfulness_query = 'AND playfulness_score > 2 '
    when 'neutral'
      playfulness_query = 'AND playfulness_score > 0 AND playfulness_score < 6 '
    when 'no'
      playfulness_query = 'AND playfulness_score < 4 '
    else
      Rails.logger.info 'error in playfulness case'
    end
    playfulness_query
  end

  def protective_query
    # Do you prefer a dog that is protective of you?
    case protective_input
    when 'yes'
      protective_query = 'AND protective_score > 2 '
    when 'no', 'neutral'
      protective_query = 'AND protective_score > 0 AND protective_score < 6 '
    else
      Rails.logger.info 'error in protective case'
    end
    protective_query
  end

  def adaptability_query
    # Will your dog be traveling with you often?
    case adaptability_input
    when 'yes', 'sometimes'
      adaptability_query = 'AND adaptability_score > 2 '
    when 'no'
      adaptability_query = 'AND adaptability_score > 0 AND adaptability_score < 6 '
    else
      Rails.logger.info 'error in adaptability case'
    end
    adaptability_query
  end

  def trainability_query
    # Is training your dog important to you?
    case trainability_input
    when 'yes'
      trainability_query = 'AND trainability_score > 2 '
    when 'no', 'neutral'
      trainability_query = 'AND trainability_score > 0 AND trainability_score < 6 '
    else
      Rails.logger.info 'error in trainability case'
    end
    trainability_query
  end

  def barking_query
    # Would a dog who barks a lot bother you?
    case barking_input
    when 'yes'
      barking_query = 'AND barking_score < 4 '
    when 'no', 'neutral'
      barking_query = 'AND barking_score > 0 AND barking_score < 6 '
    else
      Rails.logger.info 'error in barking case'
    end
    barking_query
  end

  def energy_query
    # Do you prefer a dog who has high energy?
    case energy_input
    when 'yes'
      energy_query = 'AND energy_score > 2 '
    when 'neutral'
      energy_query = 'AND energy_score > 0 AND energy_score < 6 '
    when 'no'
      energy_query = 'AND energy_score < 4 '
    else
      Rails.logger.info 'error in energy case'
    end
    energy_query
  end

  def mental_stim_query
    # Do you prefer a dog who requires a lot of mental stimulation?
    case mental_stim_input
    when 'yes'
      mental_stim_query = 'AND mental_stim_score > 3 '
    when 'neutral'
      mental_stim_query = 'AND mental_stim_score > 0 AND mental_stim_score < 6 '
    when 'no'
      mental_stim_query = 'AND mental_stim_score < 4 '
    else
      Rails.logger.info 'error in mental stim case'
    end
    mental_stim_query
  end

  private

  def destroy_associations
    result.destroy
  end
end


