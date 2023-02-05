class Dog < ApplicationRecord
  require 'csv'
  require 'open-uri'
  scope :any_size, -> { where('min_weight > 0 AND max_weight < 250') }
  scope :small, -> { where("max_weight < 22") }
  scope :medium, -> { where('min_weight > 22 AND max_weight < 55') }
  scope :large, -> { where('min_weight > 55 AND max_weight < 115') }
  scope :xl, -> { where('max_weight > 115') }
  scope :new_owner, -> { where('trainability_score > 1') }
  scope :previous_owner, -> { where('trainability_score > 0 AND trainability_score < 6') }

  def self.filter(survey)
    breeds = filter_size(survey.size_input)
    breeds = breeds.filter_family(survey.family_input)
    breeds = breeds.filter_children(survey.children_input)
    breeds = breeds.filter_other_dog(survey.other_dog_input)
    breeds = breeds.filter_shedding(survey.shedding_input)
    breeds = breeds.filter_grooming(survey.grooming_input)
    breeds = breeds.filter_drooling(survey.drooling_input)
    breeds = breeds.filter_stranger(survey.stranger_input)
    breeds = breeds.filter_playfulness(survey.playfulness_input)
    breeds = breeds.filter_protectiveness(survey.protective_input)
    breeds = breeds.filter_adaptability(survey.adaptability_input)
    breeds = breeds.filter_trainability(survey.trainability_input)
    breeds = breeds.filter_barking(survey.barking_input)
    breeds = breeds.filter_energy(survey.energy_input)
    breeds = breeds.filter_mental_stim(survey.mental_stim_input)
    breeds
  end

  def image
    formatted_name = format_name
    json = JSON.load(URI.open("https://dog.ceo/api/breed/#{formatted_name}/images/random"))
    json["message"]
  end

  def self.filter_size(size_input)
    case size_input
    when 'any'
      any_size
    when 'small'
      Rails.logger.info "small case"
      small
    when 'medium'
      Rails.logger.info "medium case"
      medium
    when 'large'
      Rails.logger.info "large case"
      large
    when 'xl'
      Rails.logger.info "xl case"
      xl
    else
      Rails.logger.info "error in size case"
    end
  end

  def self.filter_family(family_input)
    case family_input
    when 'yes'
      where('family_score > 3')
    when 'sometimes'
      where('family_score > 2')
    when 'no'
      where('family_score > 0 AND family_score < 6')
    else
      Rails.logger.info 'error in family case'
    end
  end

  def self.filter_children(children_input)
    case children_input
    when 'yes', 'sometimes'
      where('children_score > 3')
    when 'sometimes'
      where('children_score > 2')
    when 'no'
      where('children_score > 0 AND children_score < 6')
    else
      Rails.logger.info 'error in children case'
    end
  end

  def self.filter_other_dog(other_dog_input)
    case other_dog_input
    when 'yes', 'sometimes'
      where('other_dog_score > 2')
    when 'no'
      where('other_dog_score > 0 AND other_dog_score < 6')
    else
      Rails.logger.info 'error in other dog case'
    end
  end

  def self.filter_shedding(shedding_input)
    case shedding_input
    when 'yes'
      where('shedding_score < 4')
    when 'no', 'neutral'
      where('shedding_score > 0 AND shedding_score < 6')
    else
      Rails.logger.info 'error in shedding case'
    end
  end

  def self.filter_grooming(grooming_input)
    case grooming_input
    when 'yes'
      where('grooming_score < 4')
    when 'no', 'neutral'
      where('grooming_score > 0 AND grooming_score < 6')
    else
      Rails.logger.info 'error in grooming case'
    end
  end

  def self.filter_drooling(drooling_input)
    case drooling_input
    when 'yes'
      where('drooling_score < 4')
    when 'no', 'neutral'
      where('drooling_score > 0 AND drooling_score < 6')
    else
      Rails.logger.info 'error in drooling case'
    end
  end

  def self.filter_stranger(stranger_input)
    case stranger_input
    when 'yes', 'sometimes'
      where('stranger_score > 2')
    when 'no'
      where('stranger_score > 0 AND stranger_score < 6')
    else
      Rails.logger.info 'error in stranger case'
    end
  end

  def self.filter_playfulness(playfulness_input)
    case playfulness_input
    when 'yes'
      where('playfulness_score > 2')
    when 'neutral'
      where('playfulness_score > 0 AND playfulness_score < 6')
    when 'no'
      where('playfulness_score < 4')
    else
      Rails.logger.info 'error in playfulness case'
    end
  end

  def self.filter_protectiveness(protective_input)
    case protective_input
    when 'yes'
      where('protective_score > 2')
    when 'no', 'neutral'
      where('protective_score > 0 AND protective_score < 6')
    else
      Rails.logger.info 'error in protective case'
    end
  end

  def self.filter_adaptability(adaptability_input)
    case adaptability_input
    when 'yes', 'sometimes'
      where('adaptability_score > 2')
    when 'no'
      where('adaptability_score > 0 AND adaptability_score < 6')
    else
      Rails.logger.info 'error in adaptability case'
    end
  end

  def self.filter_trainability(trainability_input)
    case trainability_input
    when 'yes'
      where('trainability_score > 2')
    when 'no', 'neutral'
      where('trainability_score > 0 AND trainability_score < 6')
    else
      Rails.logger.info 'error in trainability case'
    end
  end

  def self.filter_barking(barking_input)
    case barking_input
    when 'yes'
      where('barking_score < 4')
    when 'no', 'neutral'
      where('barking_score > 0 AND barking_score < 6')
    else
      Rails.logger.info 'error in barking case'
    end
  end

  def self.filter_energy(energy_input)
    case energy_input
    when 'yes'
      where('energy_score > 2')
    when 'neutral'
      where('energy_score > 0 AND energy_score < 6')
    when 'no'
      where('energy_score < 4')
    else
      Rails.logger.info 'error in energy case'
    end
  end

  def self.filter_mental_stim(mental_stim_input)
    case mental_stim_input
    when 'yes'
      where('mental_stim_score > 3')
    when 'neutral'
      where('mental_stim_score > 0 AND mental_stim_score < 6')
    when 'no'
      where('mental_stim_score < 4')
    else
      Rails.logger.info 'error in mental stim case'
    end
  end

  def avg_weight
    ((min_weight + max_weight) / 2).round
  end

  def self.import_csv
    csv_text = File.read('public/dog-data-cleaned.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Dog.create!(row.to_hash)
    end
  end
  private
  def format_name
    name.unicode_normalize(:nfkd).encode('ASCII', replace: '').downcase.gsub(' ','-')
  end
end
