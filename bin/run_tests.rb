Dir.glob(File.join(__dir__, "..", "test", "**", "*_test.rb")).each do |file|
  require file
end