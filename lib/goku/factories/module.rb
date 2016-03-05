module Goku
  module Factories
    class Module < Base

      def to_s
        "module #{name.camelcase}\n\n#{super}\n\nend"
      end

    end
  end
end
