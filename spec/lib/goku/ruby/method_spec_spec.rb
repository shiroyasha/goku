require "spec_helper"

describe Goku::Ruby::MethodSpec do

  subject { described_class.new("log_out!") }

  describe "to_s" do
    it "creates a header" do
      expect(subject.to_s).to include('describe "#log_out!" do')
    end

    it "add extra spaces around the definition" do
      expect(subject.to_s).to match("\ndescribe")
      expect(subject.to_s).to match("end\n")
    end

    it "add an 'end' clause" do
      expect(subject.to_s).to include("end")
    end
  end

end
