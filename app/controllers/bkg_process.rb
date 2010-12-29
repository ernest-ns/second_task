class BackgroundProcess
  attr_accessor :progress
  @@progress = 0

  def progress
    @@progress
  end
  
  def start_process
    @@progress = 0
    while(@@progress < 100) do
      sleep(1/4)
      @@progress+=5
    end
  end

end
