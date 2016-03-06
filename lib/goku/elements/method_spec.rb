module Goku
  module Elements
    class MethodSpec < Base

      def to_s
        "\ndescribe \"##{name}\" do\nend\n"
      end

    end
  end
end
