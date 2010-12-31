class PagesController < ApplicationController
  
  def home
    @title = "Home"
    reset_session
    session[:background_thread] = ""
  end

  def results
    @title = "Results"
    session[:background_thread] = nil
  end

  def processing
    @title = "Wait"
    logger.info("This is before the thread has started")

    thread_process=Thread.new {
      bkg_process = BackgroundProcess.new
      bkg_process.start_process
    }

    session[:background_thread] = thread_process.object_id
#    logger.info "The value of progress just after the thread has been started#{session[:background_thread][:thread_status]}"    
  end

  def get_status
#    logger.info "Inside 'get_status' using thread variable the value of progress is :#{session[:background_thread][:thread_status]}"
    Thread.list.each do |t|
      if(t.object_id == session[:background_thread])
        render(:text => "#{t[:thread_status]}")
      end
    end
  end
end
