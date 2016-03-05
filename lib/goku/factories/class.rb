module Goku
  module Factories
    class Class < Base

      def to_s
        "class #{name.camelcase}\n#{super}\nend"
      end

    end
  end
end
