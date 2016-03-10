require "spec_helper"

describe Goku::Ruby::Spec do

  subject { described_class.new("user_helper", ["goku", "elements"]) }

  describe "to_s" do
    it "converts the name of the module to a constant" do
      expect(subject.to_s).to include("Goku::Elements::UserHelper")
    end

    it "requires spec_helper" do
      expect(subject.to_s).to include("require \"spec_helper\"")
    end

    it "creates a header" do
      expect(subject.to_s).to include("describe Goku::Elements::UserHelper do")
    end

    it "add an 'end' clause" do
      expect(subject.to_s).to include("end")
    end
  end

end
