require "application_system_test_case"

class SurveysTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
  end

  test "visiting the index" do
    visit surveys_url
    assert_selector "h1", text: "Surveys"
  end

  test "should create survey" do
    visit surveys_url
    click_on "New survey"

    fill_in "Adaptability input", with: @survey.adaptability_input
    fill_in "Barking input", with: @survey.barking_input
    fill_in "Children input", with: @survey.children_input
    fill_in "Drooling input", with: @survey.drooling_input
    fill_in "Energy input", with: @survey.energy_input
    fill_in "Family input", with: @survey.family_input
    fill_in "Grooming input", with: @survey.grooming_input
    fill_in "Mental stim input", with: @survey.mental_stim_input
    fill_in "Name input", with: @survey.name_input
    fill_in "Other dog input", with: @survey.other_dog_input
    fill_in "Playfulness input", with: @survey.playfulness_input
    fill_in "Protective input", with: @survey.protective_input
    fill_in "Shedding input", with: @survey.shedding_input
    fill_in "Size input", with: @survey.size_input
    fill_in "Stranger input", with: @survey.stranger_input
    fill_in "Trainability input", with: @survey.trainability_input
    click_on "Create Survey"

    assert_text "Survey was successfully created"
    click_on "Back"
  end

  test "should update Survey" do
    visit survey_url(@survey)
    click_on "Edit this survey", match: :first

    fill_in "Adaptability input", with: @survey.adaptability_input
    fill_in "Barking input", with: @survey.barking_input
    fill_in "Children input", with: @survey.children_input
    fill_in "Drooling input", with: @survey.drooling_input
    fill_in "Energy input", with: @survey.energy_input
    fill_in "Family input", with: @survey.family_input
    fill_in "Grooming input", with: @survey.grooming_input
    fill_in "Mental stim input", with: @survey.mental_stim_input
    fill_in "Name input", with: @survey.name_input
    fill_in "Other dog input", with: @survey.other_dog_input
    fill_in "Playfulness input", with: @survey.playfulness_input
    fill_in "Protective input", with: @survey.protective_input
    fill_in "Shedding input", with: @survey.shedding_input
    fill_in "Size input", with: @survey.size_input
    fill_in "Stranger input", with: @survey.stranger_input
    fill_in "Trainability input", with: @survey.trainability_input
    click_on "Update Survey"

    assert_text "Survey was successfully updated"
    click_on "Back"
  end

  test "should destroy Survey" do
    visit survey_url(@survey)
    click_on "Destroy this survey", match: :first

    assert_text "Survey was successfully destroyed"
  end
end
