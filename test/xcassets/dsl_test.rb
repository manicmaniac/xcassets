require 'test_helper'

class DSLTest < Minitest::Test
  include XCAssets::DSL

  def test_scenario
    Dir.mktmpdir do |dir|
      assets = xcassets 'Assets' do
        iconset 'LaunchImage' do
          image fixture('40x40.png') => 'Default.png'
          image fixture('40x40.png')
        end
      end
      assets.save(dir)
    end
  end
end
