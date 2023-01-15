class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show results ]

  # GET /surveys/1 or /surveys/1.json
  def show
    result = @survey.result
    @first_breed = Dog.find result.breed_id
    Rails.logger.info @first_breed.to_s
    Rails.logger.info '-' * 15
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # POST /surveys or /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @survey.id = Survey.generate_uuid
    Rails.logger.info @survey.attributes.to_s
    Rails.logger.info '#' * 15
    params.inspect
    if @survey.save!
      Rails.logger.info "SURVEY SHOULD BE SAVED"
      redirect_to survey_path(@survey.id)
    else
      flash[:error] = "something went wrong saving the survey. woops"
    end
  end

  def results
    if params[:size_input] == 'small'
      @suggested_breeds = Dog.small
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:id, :name_input, :new_owner_input, :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input, :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input, :trainability_input, :energy_input, :barking_input, :mental_stim_input)
    end
end
