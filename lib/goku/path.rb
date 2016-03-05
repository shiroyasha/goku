module Goku
  class PathConversionError < StandardError; end

  class Path
    attr_reader :full

    def initialize(raw_path)
      @full= raw_path
    end

    def directories
      File.dirname(full).split("/")
    end

    def filename
      File.basename(full, extension)
    end

    def extension
      File.extname(full)
    end

    def spec?
      directories.first == "spec"
    end

    def implementation?
      !spec?
    end

    def to_spec
      raise Goku::PathConversionError.new("Path is already a specification") if spec?

      Goku::Path.new(File.join(["spec", directories, "#{filename}_spec#{extension}"]))
    end

    def to_implementation
      raise Goku::PathConversionError.new("Path is already an implementation") if implementation?

      Goku::Path.new(File.join([directories.drop(1), "#{filename.gsub(/_spec$/, "")}#{extension}"]))
    end

    alias :test? :spec?

  end
end
