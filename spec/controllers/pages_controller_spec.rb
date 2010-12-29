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

  describe "GET 'processing'" do
    it "should be successful" do
      get 'processing'
      response.should be_success
    end

    it "should have right titles" do
      get 'processing'
      response.should have_selector('title', :content => "Wait")
    end
  end
end
