RSpec::Matchers.define :be_just_now do
  match do |actual|
    Time.now - actual < 1
  end
end

RSpec::Matchers.define :be_positive do
  match do |actual|
    actual > 0
  end
end