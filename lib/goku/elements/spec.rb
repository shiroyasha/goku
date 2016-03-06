module Goku
  module Elements
    class Spec < Base

      def to_s
        "describe #{name.camelcase}\n#{super}\nend"
      end

    end
  end
end
