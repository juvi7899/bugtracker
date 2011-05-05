require 'simplecov'
require 'timecop'

SimpleCov.start do
    add_filter 'spec'
end

# Setting "now" to May 15, 2008 10:00:00 AM
Timecop.travel(Time.local(2008, 5, 15, 10, 0, 0))
