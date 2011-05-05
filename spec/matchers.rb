RSpec::Matchers.define :have_identical_contents_with do |second_file|
  match do |first_file|
    lines_1 = []
    lines_2 = []

    file = File.open(first_file, "r")
    while (line = file.gets)
      lines_1 << line
    end

    file = File.open(second_file, "r")
    while (line = file.gets)
      lines_2 << line
    end

    lines_1 == lines_2
  end
end

RSpec::Matchers.define :be_natural_number do
  match do |actual|
    actual.is_a?(Integer) && actual >= 1
  end
end
