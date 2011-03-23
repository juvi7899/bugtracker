require 'digest/sha1'

class User
  attr_accessor :name, :password, :type

  def initialize(name, password, type)
    @name = name
    @password = Digest::SHA1.hexdigest(password)
    @type = type
  end
end

