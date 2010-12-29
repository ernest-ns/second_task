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

