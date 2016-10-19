$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'xcassets'
require 'xcassets/dsl'

require 'minitest/autorun'

def fixture(filename)
  fixtures_path = File.expand_path('../fixtures', __FILE__)
  File.join(fixtures_path, filename)
end
