require 'json'

module XCAssets
  class Iconset
    attr_reader :name, :author, :version, :images

    def initialize(name, author: 'xcassets', version: 1)
      @name = name
      @images = []
      @author = author
      @version = version
    end

    def info
      { author: @author, version: @version }
    end

    def contents
      @images.each_with_object(info: info, images: []) do |image, hash|
        hash[:images] << image.contents
      end
    end

    def add(image)
      @images << image
    end

    def save(parent_path)
      path = File.join(parent_path, "#{name}.iconset")
      Dir.mkdir(path)
      @images.each do |image|
        image.save(path)
      end
      json_path = File.join(path, 'Contents.json')
      File.open(json_path, 'w') do |file|
        JSON.dump(contents, file)
      end
    end
  end
end
