module Goku
  class ElementFactory

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def create_class
      nested(Goku::Elements::Class.new(path.filename))
    end

    def create_module
      nested(Goku::Elements::Module.new(path.filename))
    end

    def create_spec
      Goku::Elements::Spec.new(path.filename, ancestor_names)
    end

    def ancestors
      @ancestors ||= ancestor_names.map { |m| Goku::Elements::Module.new(m) }
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
