require "spec_helper"

describe Goku::Factories::Class do

  subject { described_class.new("User") }

  describe "#add_method" do
  end

  describe "to_s" do
    it "creates a header" do
      expect(subject.to_s).to include("class User")
    end

    it "add an 'end' clause" do
      expect(subject.to_s).to include("end")
    end
  end

end
