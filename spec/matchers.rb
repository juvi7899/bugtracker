RSpec::Matchers.define :be_close_to_now do |delta|
  match do |actual|
    Time.now - actual < delta
  end
end
