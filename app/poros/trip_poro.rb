class Trip
  attr_reader :time

  def initialize(data)
    @time = data[:route][:legs][0][:time]
  end
end
