module Goku
  class Ruby
    require_relative "ruby/base"
    require_relative "ruby/method"
    require_relative "ruby/class"
    require_relative "ruby/module"
    require_relative "ruby/spec"
    require_relative "ruby/method_spec"

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def create_class
      nested(Goku::Ruby::Class.new(path.filename))
    end

    def create_module
      nested(Goku::Ruby::Module.new(path.filename))
    end

    def create_spec
      Goku::Ruby::Spec.new(path.filename, ancestor_names)
    end

    def ancestors
      @ancestors ||= ancestor_names.map { |m| Goku::Ruby::Module.new(m) }
    end

    def ancestor_names
      @ancestor_names ||= @path.directories.drop(1)
    end

    def nested(element)
      elements = ancestors << element

      elements.each_cons(2) { |parent, sub| parent.add(sub) }

      elements.first
    end

  end
end
