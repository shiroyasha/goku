require "spec_helper"

describe Goku::Ruby do
  let(:path) { Goku::Path.new("lib/goku/something/test.rb") }
  subject { described_class.new(path) }

  describe "#ancestor_names" do
    it "lists all the ancestors" do
      expect(subject.ancestor_names).to include "goku"
      expect(subject.ancestor_names).to include "something"
    end

    it "sorts the ancestors from the top to the bottom" do
      expect(subject.ancestor_names.last).to eq "something"
      expect(subject.ancestor_names.first).to eq "goku"
    end
  end

  describe "#ancestors" do
    it "returns a list of modules" do
      subject.ancestors.each do |ancestor|
        expect(ancestor).to be_instance_of(Goku::Ruby::Module)
      end
    end

    it "creates a module for each ancestor name" do
      expect(subject.ancestors.map(&:name)).to match_array(subject.ancestor_names)
    end
  end

  describe "#nested" do
    let(:klass) { Goku::Ruby::Class.new("test") }

    it "returns the top ancestor" do
      expect(subject.nested(klass).name).to eq("goku")
    end

    it "nests the element under the deepest ancestor" do
      goku = subject.nested(klass)
      something = goku.elements.first
      test = something.elements.first

      expect(test).to eq klass
    end

    context "when there are no ancestors" do
      it "returns the passed element" do
        ruby = described_class.new(Goku::Path.new("lib/test.rb"))

        klass = Goku::Ruby::Class.new("test")

        expect(ruby.nested(klass)).to eq(klass)
      end
    end
  end

end
