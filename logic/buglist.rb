require 'date'

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

  def find(search)
    result = []
    @bugs.each do |bug|
      if search[:name] 
        if bug.name.downcase.index(search[:name].downcase)
          result << bug
        else
          result.delete(bug)
        end
      end
      if search[:priority]
        if bug.priority == search[:priority]
          result << bug
        else
          result.delete(bug)
        end
      end
      if search[:status]
        if bug.status == search[:status]
          result << bug
        else
          result.delete(bug)
        end
      end
      if search[:creator]
        if bug.creator == search[:creator]
          result << bug
        else
          result.delete(bug)
        end
      end
      if search[:date]
        if Date.parse(bug.date.to_s) == search[:date]
          result << bug
        else
          result.delete(bug)
        end
      end
    end
    result
  end
end
