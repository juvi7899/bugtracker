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

  def find(text)
    result = []
    @entries.each do |entry|
      if entry.downcase.index(text.downcase)
        result << entry
      end
    end
    result
  end
end
