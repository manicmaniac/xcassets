require 'json'

module XCAssets
  class XCAssets
    attr_reader :name, :author, :version, :iconsets

    def initialize(name, author: 'xcassets', version: 1)
      @name = name
      @author = author
      @version = version
      @iconsets = []
    end

    def info
      { author: @author, version: @version }
    end

    def contents
      { info: info }
    end

    def add(iconset)
      @iconsets << iconset
    end

    def save(parent_path)
      path = File.join(parent_path, "#{name}.xcassets")
      Dir.mkdir(path)
      @iconsets.each do |iconset|
        iconset.save(path)
      end
      json_path = File.join(path, 'Contents.json')
      File.open(json_path, 'w') do |file|
        JSON.dump(contents, file)
      end
    end
  end
end
