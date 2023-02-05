class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show results ]

  # GET /surveys/1 or /surveys/1.json
  def show
    result = @survey.result
    @first_breed = Dog.find result.breed_id
    @breed_image = @first_breed.image
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @questions = Question.all
    @input_attributes = @survey.input_attributes
  end

  # POST /surveys or /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @survey.id = Survey.generate_uuid
    params.inspect
    if @survey.save!
      redirect_to survey_path(@survey.id)
    else
      flash[:error] = "Something went wrong saving the survey. Please refresh and try again."
    end
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:id, :name_input, :new_owner_input, :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input, :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input, :trainability_input, :energy_input, :barking_input, :mental_stim_input)
    end
end
