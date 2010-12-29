require 'bkg_process'
class PagesController < ApplicationController
  def home
   @title = "Home"
  end

  def results
    @title = "Results"
    #create a process that runs for 6 seconds and responds to ajax requests
  end

  def processing
    @title = "Wait"
    t1 = Thread.new{background_process()}
  end
  
  def get_status
    @t1["status"]
  end

  def background_process
    status = 0
    unless(status==100)
      sleep(10000)
      status+=5
    end
  end

end
