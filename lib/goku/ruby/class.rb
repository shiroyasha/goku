module Goku
  class Ruby
    class Class < Base

      def initialize(name)
        super

        initializer = Goku::Ruby::Method.new("initialize")

        add(initializer)
      end

      def to_s
        "class #{name.camelcase}\n#{super}\nend"
      end

    end
  end
end
