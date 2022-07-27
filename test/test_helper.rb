# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'xcassets'
require 'xcassets/dsl'

require 'minitest/autorun'

def fixture(filename)
  fixtures_path = File.expand_path('fixtures', __dir__)
  File.join(fixtures_path, filename)
end
