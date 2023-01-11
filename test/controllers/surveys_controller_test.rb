require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
  end

  test "should get index" do
    get surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_url
    assert_response :success
  end

  test "should create survey" do
    assert_difference("Survey.count") do
      post surveys_url, params: { survey: { adaptability_input: @survey.adaptability_input, barking_input: @survey.barking_input, children_input: @survey.children_input, drooling_input: @survey.drooling_input, energy_input: @survey.energy_input, family_input: @survey.family_input, grooming_input: @survey.grooming_input, mental_stim_input: @survey.mental_stim_input, name_input: @survey.name_input, other_dog_input: @survey.other_dog_input, playfulness_input: @survey.playfulness_input, protective_input: @survey.protective_input, shedding_input: @survey.shedding_input, size_input: @survey.size_input, stranger_input: @survey.stranger_input, trainability_input: @survey.trainability_input } }
    end

    assert_redirected_to survey_url(Survey.last)
  end

  test "should show survey" do
    get survey_url(@survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_url(@survey)
    assert_response :success
  end

  test "should update survey" do
    patch survey_url(@survey), params: { survey: { adaptability_input: @survey.adaptability_input, barking_input: @survey.barking_input, children_input: @survey.children_input, drooling_input: @survey.drooling_input, energy_input: @survey.energy_input, family_input: @survey.family_input, grooming_input: @survey.grooming_input, mental_stim_input: @survey.mental_stim_input, name_input: @survey.name_input, other_dog_input: @survey.other_dog_input, playfulness_input: @survey.playfulness_input, protective_input: @survey.protective_input, shedding_input: @survey.shedding_input, size_input: @survey.size_input, stranger_input: @survey.stranger_input, trainability_input: @survey.trainability_input } }
    assert_redirected_to survey_url(@survey)
  end

  test "should destroy survey" do
    assert_difference("Survey.count", -1) do
      delete survey_url(@survey)
    end

    assert_redirected_to surveys_url
  end
end
