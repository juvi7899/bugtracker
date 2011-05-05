require 'digest/sha1'
require 'time'
require './logic/simplerecord'

class User < SimpleRecord
  has_one :name, :password, :type, :banned, :registered

  def initialize(params = {})
    super()
    @name = params[:name]
    @password = Digest::SHA1.hexdigest(params[:password])
    @type = params[:type]
    @banned = false
    @registered = Time.now
  end

  def password=(password)
    @password = Digest::SHA1.hexdigest(password)
  end

  def self.login(username, password)
    self.find(:first, :name => username, :password => Digest::SHA1.hexdigest(password), :banned => false)
  end
end
