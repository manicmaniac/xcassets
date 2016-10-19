require 'fileutils'
require 'fastimage'

module XCAssets
  class Image
    attr_reader :source, :filename, :size, :idiom, :scale

    def initialize(source, filename: nil, size: nil, idiom: nil, scale: nil)
      unless File.readable?(source)
        raise IOError, "#{File.absolute_path(source)} is not readable."
      end
      @source = source
      @filename = filename || File.basename(source)
      @size = size || FastImage.size(source).join('x')
      @idiom = (idiom || guess_idiom).to_sym
      @scale = (scale || guess_scale).to_i
    end

    def contents
      {
        filename: @filename,
        size: @size,
        idiom: @idiom.to_s,
        scale: "#{@scale}x"
      }
    end

    def save(parent_path)
      new_path = File.join(parent_path, filename)
      FileUtils.copy(@source, new_path)
    end

    private

    def guess_idiom
      if @filename.include?('~iphone') then :iphone
      elsif @filename.include?('~ipad') then :ipad
      else :universal
      end
    end

    def guess_scale
      basename = File.basename(@filename, '.*')
      if basename.end_with?('@2x') then 2
      elsif basename.end_with?('@3x') then 3
      else 1
      end
    end
  end
end
