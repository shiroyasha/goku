module Goku
  class Path

    def initialize(raw_path)
      @raw_path = raw_path
    end

    def directories
      File.dirname(@raw_path).split("/")
    end

    def filename
      File.basename(@raw_path)
    end

    def spec?
      directories.first == "spec"
    end

    def implementation?
      directories.first == "spec"
    end

    alias :test? :spec?

  end
end
