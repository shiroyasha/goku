module Goku
  class ElementFactory

    attr_reader :path

    def initialize(raw_path)
      @path = Goku::Path.new(raw_path)
    end

    def create_class
      nested(Goku::Elements::Class.new(path.filename))
    end

    def create_module
      nested(Goku::Elements::Module.new(path.filename))
    end

    def ancestors
      @ancestors ||= ancestor_names.map { |m| Goku::Elements::Module.new(m) }
    end

    def ancestor_names
      @ancestor_names ||= @path.directories.drop(1).reverse
    end

    def nested(element)
      ancestors.each_cons(2) { |sub, parent| parent.add(sub) }

      ancestors.first.add(element)

      ancestors.last
    end

  end
end
