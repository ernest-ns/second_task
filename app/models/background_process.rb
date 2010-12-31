class BackgroundProcess

  attr_accessor :progress
  
  def initialize
    @progress = 0
  end

  def start_process
    puts "inside start_process"
    while(@progress < 100) do
      @progress+=5
      Thread.current[:thread_status] = @progress
      dummy_sleep(20)  
      puts "Inside the while loop of 'start_process' the value of progress is :#{progress}"
    end
    puts "On completion of the while loop the value of progress is#{progress}"
  end

  def dummy_sleep(factor)
    puts "Inside dummy sleep with factor #{factor}"
   count = 1000000 * factor
    while (count>0) do
      count -=1
    end
  end

end
