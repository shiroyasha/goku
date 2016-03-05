module Goku
  module Factories
    class Class < Base

      def initialize(name)
        super

        initializer = Goku::Factories::Method.new("initialize")

        add(initializer)
      end

      def to_s
        "class #{name.camelcase}\n#{super}\nend"
      end

    end
  end
end
