RSpec::Matchers.define :be_just_now do
  match do |actual|
    Time.now - actual < 1
  end
end

RSpec::Matchers.define :be_natural_number do
  match do |actual|
    actual.is_a?(Integer) && actual >= 1
  end
end