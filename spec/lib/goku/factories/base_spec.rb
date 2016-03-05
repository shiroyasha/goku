require "spec_helper"

describe Goku::Factories::Base do

  subject { described_class.new("user") }

  describe "#add" do
    it "add a subelement to the element" do
      expect(subject.elements).to eq([])

      element = described_class.new("test")

      subject.add(element)

      expect(subject.elements).to include(element)
    end
  end

  describe "to_s" do
    let(:initialize_method) { Goku::Factories::Method.new(:initialize) }

    it "includes the subelement in the class" do
      subject.add(initialize_method)

      expect(subject.to_s).to include("def initialize")
    end

    it "indents the method in the class" do
      subject.add(initialize_method)

      expect(subject.to_s).to include("  def")
    end
  end

end
