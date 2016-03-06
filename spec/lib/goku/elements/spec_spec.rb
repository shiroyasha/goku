require "spec_helper"

describe Goku::Elements::Spec do

  subject { described_class.new("user_helper") }

  describe "to_s" do
    it "converts the name of the module to a constant" do
      expect(subject.to_s).to include("UserHelper")
    end

    it "creates a header" do
      expect(subject.to_s).to include("describe UserHelper")
    end

    it "add an 'end' clause" do
      expect(subject.to_s).to include("end")
    end
  end

end
