module Goku
  module Factories
    class Base

      attr_reader :name
      attr_reader :elements

      def initialize(name)
        @name = name
        @elements = []
      end

      def add(element)
        @elements << element
      end

      def to_s
        elements.map(&:to_s).map { |el| el.indent(2) }.join
      end

    end
  end
end
