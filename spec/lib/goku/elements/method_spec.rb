require "spec_helper"

describe Goku::Elements::Method do

  subject { described_class.new("initialize") }

  describe "to_s" do
    it "creates a header" do
      expect(subject.to_s).to include("def initialize")
    end

    it "add extra spaces around the definition" do
      expect(subject.to_s).to match("\ndef")
      expect(subject.to_s).to match("end\n")
    end

    it "add an 'end' clause" do
      expect(subject.to_s).to include("end")
    end
  end

end
