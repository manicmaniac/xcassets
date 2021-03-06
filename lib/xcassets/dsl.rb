require 'xcassets'

module XCAssets
  module DSL
    def xcassets(name, **options, &block)
      @assets = ::XCAssets::XCAssets.new(name, **options)
      instance_eval(&block)
      @assets
    end

    def iconset(name, **options, &block)
      @iconset = ::XCAssets::Iconset.new(name, **options)
      @assets.add(@iconset) if @assets
      instance_eval(&block)
      @iconset
    end

    def image(source, **options)
      source, options[:filename] = source.first if source.is_a?(Hash)
      image = ::XCAssets::Image.new(source, **options)
      @iconset.add(image)
      image
    end

    def images(*filenames)
      filenames.flat_map { |filename| Dir.glob(filename) }
               .each { |filename| image(filename) }
    end
  end
end
