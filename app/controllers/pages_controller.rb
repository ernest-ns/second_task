class PagesController < ApplicationController
  
  def home
    @title = "Home"
    reset_session
    session[:bkg_process] = BackgroundProcess.new
  end

  def results
    @title = "Results"
    session[:bkg_process] = nil
  end

  def processing
    @title = "Wait"
    logger.info("This is before the thread has started")

    thread_process=Thread.new {
      session[:bkg_process].start_process
    }
    session[:thread_process] = thread_process
    logger.info("This is after the thread has been stared:#{t}")
    logger.info "The value of progress just after the thread has been started#{session[:bkg_process].progress}"    
  end

  def get_status
    logger.info "Inside get status with the value of progress as :#{session[:bkg_process].progress}"
    logger.info "Inside 'get_status' using thread variable the value of progress is :#{session[:thread_process]["thread_status"]}"
    render(:text => "#{session[:bkg_process].progress}" )
  end
end
