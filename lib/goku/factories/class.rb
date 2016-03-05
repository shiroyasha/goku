module Goku
  module Factories
    class Class

      attr_reader :name
      attr_reader :methods

      def initialize(name)
        @name = name
        @methods = []
      end

      def add_method(method)
        @methods << method
      end

      def to_s
        "class #{name}\nend"
      end

    end
  end
end
