module Goku
  module Factories
    class Class < Base

      def to_s
        "class #{name.camelcase}\n\n#{super}\n\nend"
      end

    end
  end
end
