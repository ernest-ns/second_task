require 'bkg_process'
class PagesController < ApplicationController
  
  def home
   @title = "Home"
  end

  def results
    @title = "Results"
  end

  def processing
    @title = "Wait"
    logger.info("going to start background process")

    t=Thread.new {
      bkg_process = BackgroundProcess.new
      bkg_process.start_process}
    logger.info("should have started background process")
  end

  def redirection
    render :results
  end
  
  def get_status
    logger.info "inside the action get_status"
    bkg_process = BackgroundProcess.new
    progress = bkg_process.progress
    logger.info "hello#{progress}"
    render(:text => "#{progress}" )
  end
end
