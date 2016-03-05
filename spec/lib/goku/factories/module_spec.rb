require "spec_helper"

describe Goku::Factories::Module do

  subject { described_class.new("user_helper") }

  let(:logged_in_method) { Goku::Factories::Method.new(:logged_in?) }

  describe "#add_method" do
    it "add a method to the module" do
      expect(subject.methods).to eq([])

      subject.add_method(logged_in_method)

      expect(subject.methods).to include(logged_in_method)
    end
  end

  describe "to_s" do
    it "converts the name of the module to a constant" do
      expect(subject.to_s).to include("UserHelper")
    end

    it "creates a header" do
      expect(subject.to_s).to include("module UserHelper")
    end

    it "includes the method in the module" do
      subject.add_method(logged_in_method)

      expect(subject.to_s).to include("def logged_in?")
    end

    it "indents the method in the module" do
      subject.add_method(logged_in_method)

      expect(subject.to_s).to include("  def")
    end

    it "leaves an extra space after the module definition" do
      subject.add_method(logged_in_method)

      expect(subject.to_s).to include("module UserHelper\n\n  def logged_in?")
    end

    it "add an 'end' clause" do
      expect(subject.to_s).to include("end")
    end
  end

end
