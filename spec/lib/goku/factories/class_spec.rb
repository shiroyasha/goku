require "spec_helper"

describe Goku::Factories::Class do

  subject { described_class.new("user_controller") }

  let(:initialize_method) { Goku::Factories::Method.new(:initialize) }

  describe "#add_method" do
    it "add a method to the class" do
      expect(subject.methods).to eq([])

      subject.add_method(initialize_method)

      expect(subject.methods).to include(initialize_method)
    end
  end

  describe "to_s" do
    it "converts the name of the class to a constant" do
      expect(subject.to_s).to include("UserController")
    end

    it "creates a header" do
      expect(subject.to_s).to include("class UserController")
    end

    it "includes the method in the class" do
      subject.add_method(initialize_method)

      expect(subject.to_s).to include("def initialize")
    end

    it "indents the method in the class" do
      subject.add_method(initialize_method)

      expect(subject.to_s).to include("  def")
    end

    it "leaves an extra space after the class definition" do
      subject.add_method(initialize_method)

      expect(subject.to_s).to include("class UserController\n\n  def initialize")
    end

    it "add an 'end' clause" do
      expect(subject.to_s).to include("end")
    end
  end

end
