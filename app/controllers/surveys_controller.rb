class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show results ]
  before_action :set_questions

  # GET /surveys/1 or /surveys/1.json
  def show
    result = @survey.result
    @first_breed = Dog.find result.breed_id
    @breed_image = @first_breed.image
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @input_attributes = @survey.input_attributes
  end

  # POST /surveys or /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @survey.id = Survey.generate_uuid
    respond_to do |format|
      if @survey.save
        format.html { redirect_to survey_path(@survey), notice: "Survey was successfully created." }
      else
        @input_attributes = @survey.input_attributes
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def set_questions
    @questions = Question.all
  end

  def survey_params
    params.require(:survey).permit(:id, :name_input, :new_owner_input, :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input, :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input, :trainability_input, :energy_input, :barking_input, :mental_stim_input)
  end
end
