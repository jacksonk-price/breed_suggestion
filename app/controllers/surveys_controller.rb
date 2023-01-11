class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show results ]

  # GET /surveys/1 or /surveys/1.json
  def show
    result = @survey.result
    @first_breed = Dog.find result.first_breed_id
    @second_breed = Dog.find result.second_breed_id
    @third_breed = Dog.find result.third_breed_id
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # POST /surveys or /surveys.json
  def create
    @survey = Survey.new(survey_params)

    if @survey.save!
      redirect_to survey_path(@survey)
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
      params.require(:survey).permit(:name_input, :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input, :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input, :trainability_input, :energy_input, :barking_input, :mental_stim_input)
    end
end
