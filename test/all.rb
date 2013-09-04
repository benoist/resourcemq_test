$: << 'test'

Dir['./**/*_test.rb'].each do |test|
  require test
end
