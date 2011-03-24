class Log
  def initialize
    @entries = []
  end

  def size
    @entries.size
  end

  def add(message)
    @entries << message
  end

  def [](index)
    @entries[index]
  end
end
