# frozen_string_literal: true

require 'test_helper'

class ImageTest < Minitest::Test
  def setup
    @image = XCAssets::Image.new(fixture('40x40.png'))
  end

  def test_contents
    assert_equal @image.contents, filename: '40x40.png',
                                  size: '40x40',
                                  idiom: 'universal',
                                  scale: '1x'
  end

  def test_save
    Dir.mktmpdir do |dir|
      @image.save(dir)
      path = File.join(dir, '40x40.png')
      assert File.exist?(path)
    end
  end
end
