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
        strigified_methods = methods
                              .map(&:to_s)
                              .map { |method| method.indent(2) }
                              .join("\n\n")

        "class #{name.camelcase}\n\n#{strigified_methods}\n\nend"
      end

    end
  end
end
