require 'digest/sha1'

class User
  attr_accessor :name, :type, :banned

  def initialize(name, password, type)
    @name = name
    @password = Digest::SHA1.hexdigest(password)
    @type = type
    @banned = false
  end

  def password
    @password
  end

  def password=(password)
    @password = Digest::SHA1.hexdigest(password)
  end
end

