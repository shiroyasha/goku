module Goku
  class Ruby
    class Spec < Base

      def initialize(name, ancestor_names)
        super(name)

        @ancestor_names = ancestor_names
      end

      def to_s
        full_name = (@ancestor_names + [name]).map(&:camelcase).join("::")

        "require \"spec_helper\"\n\ndescribe #{full_name} do\n#{super}\nend"
      end

    end
  end
end
