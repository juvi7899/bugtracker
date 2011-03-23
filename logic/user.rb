require 'digest/sha1'

class User
  attr_accessor :name, :type

  def initialize(name, password, type)
    @name = name
    @password = Digest::SHA1.hexdigest(password)
    @type = type
  end

  def password
    @password
  end

  def password=(password)
    @password = Digest::SHA1.hexdigest(password)
  end
end

