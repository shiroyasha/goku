require "spec_helper"

describe Goku::ElementFactory do

  describe "#ancestor_names" do
    subject { described_class.new("lib/goku/something/test.rb") }

    it "lists all the ancestors" do
      expect(subject.ancestor_names).to include "goku"
      expect(subject.ancestor_names).to include "something"
    end

    it "sorts the ancestors from the bottom to the top" do
      expect(subject.ancestor_names.first).to eq "something"
      expect(subject.ancestor_names.last).to eq "goku"
    end
  end

  describe "#ancestors" do
    subject { described_class.new("lib/goku/something/test.rb") }

    it "returns a list of modules" do
      subject.ancestors.each do |ancestor|
        expect(ancestor).to be_instance_of(Goku::Elements::Module)
      end
    end

    it "creates a module for each ancestor name" do
      expect(subject.ancestors.map(&:name)).to match_array(subject.ancestor_names)
    end
  end

  describe "#nested" do
    subject { described_class.new("lib/goku/something/test.rb") }

    let(:klass) { Goku::Elements::Class.new("test") }

    it "returns the top ancestor" do
      expect(subject.nested(klass).name).to eq("goku")
    end

    it "nests the element under the deepest ancestor" do
      goku = subject.nested(klass)
      something = goku.elements.first
      test = something.elements.first

      expect(test).to eq klass
    end
  end

end
