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
      search.each_key do |search_by|
        case search_by
          when :name, :creator
            if bug.send(search_by).downcase.index(search[search_by].downcase)
              result << bug
            else
              result.delete(bug)
            end
          else
            if bug.send(search_by) == search[search_by]
              result << bug
            else
              result.delete(bug)
            end
          end
        end
      end
    result
  end
end
