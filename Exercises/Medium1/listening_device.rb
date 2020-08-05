
class Device
  def initialize
    @recordings = []
  end

  def listen
    # return unless block_given? ## Their first solution
    # recording = yield
    # record(recording)
   
    # if block_given?  ## This works as well
    #   record(yield)
    # end

    recording = yield if block_given? ## Best solution, doesn't add anything if there is an empty block
    record(recording) if recording
  end

  def record(recording)
    @recordings << recording
  end

  def play 
    puts @recordings.last
  end

end


listener = Device.new
listener.listen { "Hello World!" }
listener.listen { }
listener.listen
listener.play # Outputs "Hello World!"

