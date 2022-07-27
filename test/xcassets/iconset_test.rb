# frozen_string_literal: true

require 'test_helper'

class IconsetTest < Minitest::Test
  def setup
    @iconset = XCAssets::Iconset.new('name')
    image = XCAssets::Image.new(fixture('40x40.png'))
    @iconset.add(image)
  end

  def test_contents
    assert_equal @iconset.contents,
                 images: [
                   {
                     filename: '40x40.png',
                     size: '40x40',
                     idiom: 'universal',
                     scale: '1x'
                   }
                 ],
                 info: { author: 'xcassets', version: 1 }
  end

  def test_save
    Dir.mktmpdir do |dir|
      @iconset.save(dir)
      path = File.join(dir, 'name.iconset')
      assert Dir.exist?(path)
      assert File.exist?(File.join(path, '40x40.png'))
      assert File.exist?(File.join(path, 'Contents.json'))
    end
  end
end
