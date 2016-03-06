module Goku
  module Elements
    class Method < Base

      def to_s
        "\ndef #{name}\nend\n"
      end

    end
  end
end
