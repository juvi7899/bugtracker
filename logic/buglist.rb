class BugList
  def initialize
    @bugs = []
  end

  def size
    @bugs.size
  end

  def add(bug)
    @bugs << bug
  end

  def [](index)
    @bugs[index]
  end

  def find(name = nil, priority = nil, status = nil, creator = nil, date = nil)
    result = []
    @bugs.each do |bug|
      if name && name.downcase.index(bug.name.downcase)
        result << bug
      end
    end
    result
  end
end
