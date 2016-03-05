module Goku
  module Factories
    class Method

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def to_s
        "def #{name}\nend"
      end

    end
  end
end
