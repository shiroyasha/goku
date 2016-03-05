module Goku
  module Factories
    class Method < Base

      def to_s
        "def #{name}\nend"
      end

    end
  end
end
