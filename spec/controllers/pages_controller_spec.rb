require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have right title" do
      get 'home'
      response.should have_selector('title', :content => "Home")
    end
  end

  describe "GET 'results'" do
    it "should be successful" do
      get 'results'
      response.should be_success
    end

    it "should have right title" do
      get 'results'
      response.should have_selector('title', :content => "Results")
    end
  end

  describe "GET 'get_status'" do
    it "should be sucessful" do
    end
  end

  describe "'background_process' should set status variable to 100" do
    it "should be successful" do
      pc = BackgroundProcess.new
      pc.start_process
      pc.progress.should equal(100)
    end

    it "should have right titles" do
      session[:bkg_process] = BackgroundProcess.new
      get 'processing'
      response.should have_selector('title', :content => "Wait")
    end
  end
end
