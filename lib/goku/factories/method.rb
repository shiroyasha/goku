module Goku
  module Factories
    class Method < Base

      def to_s
        "\ndef #{name}\nend\n"
      end

    end
  end
end
