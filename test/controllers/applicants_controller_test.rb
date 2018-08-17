require 'test_helper'

class ApplicantsControllerTest < ActionController::TestCase
  setup do
    @job = jobs(:one)
    @applicant = applicants(:one)
  end

  test "should get index" do
    get :index, params: { job_id: @job }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { job_id: @job }
    assert_response :success
  end

  test "should create applicant" do
    assert_difference('Applicant.count') do
      post :create, params: { job_id: @job, applicant: @applicant.attributes }
    end

    assert_redirected_to job_applicant_path(@job, Applicant.last)
  end

  test "should show applicant" do
    get :show, params: { job_id: @job, id: @applicant }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { job_id: @job, id: @applicant }
    assert_response :success
  end

  test "should update applicant" do
    put :update, params: { job_id: @job, id: @applicant, applicant: @applicant.attributes }
    assert_redirected_to job_applicant_path(@job, Applicant.last)
  end

  test "should destroy applicant" do
    assert_difference('Applicant.count', -1) do
      delete :destroy, params: { job_id: @job, id: @applicant }
    end

    assert_redirected_to job_applicants_path(@job)
  end
end
