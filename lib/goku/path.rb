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

  end
end
