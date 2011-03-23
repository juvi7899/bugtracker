RSpec::Matchers.define :be_just_now do
  match do |actual|
    Time.now - actual < 1
  end
end
