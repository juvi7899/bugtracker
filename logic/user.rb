require 'digest/sha1'
require 'time'

class User
  attr_accessor :name, :type, :banned

  def initialize(name, password, type)
    @name = name
    @password = Digest::SHA1.hexdigest(password)
    @type = type
    @banned = false
    @registered = Time.now
  end

  def password
    @password
  end

  def password=(password)
    @password = Digest::SHA1.hexdigest(password)
  end
  
  def registered
		@registered
	end
end
