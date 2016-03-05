require "spec_helper"

describe Goku::Path do
  let(:implementation) { described_class.new("lib/goku/builders/class_builder.rb") }
  let(:spec) { described_class.new("spec/lib/goku/builders/class_builder_spec.rb") }

  describe "#directories" do
    subject { implementation }

    it "returns all the directories in the path" do
      expect(subject.directories).to eq([
        "lib",
        "goku",
        "builders"
      ])
    end
  end

  describe "#filename" do
    subject { implementation }

    it "returns the name of the file" do
      expect(subject.filename).to eq("class_builder")
    end
  end

  describe "#extension" do
    subject { implementation }

    it "returns the name of the file" do
      expect(subject.extension).to eq(".rb")
    end
  end

  describe "#spec?" do
    context "when the path is a spec file" do
      it { expect(spec).to be_spec }
    end

    context "when the path is not a spec file" do
      it { expect(implementation).to_not be_spec }
    end
  end

  describe "#test?" do
    context "when the path is a spec file" do
      it { expect(spec).to be_test }
    end

    context "when the path is not a spec file" do
      it { expect(implementation).to_not be_test }
    end
  end

  describe "#implementation?" do
    context "when the path is a spec file" do
      it { expect(spec).to_not be_implementation }
    end

    context "when the path is not a spec file" do
      it { expect(implementation).to be_implementation }
    end
  end

  describe "#to_spec" do
    context "when the path is a spec file" do
      it { expect { spec.to_spec }.to raise_exception(Goku::PathConversionError) }
    end

    context "when the path is an implementation file" do
      it { expect(implementation.to_spec.full).to eq(spec.full) }
    end
  end

  describe "#to_implementation" do
    context "when the path is an implementation file" do
      it { expect { implementation.to_implementation }.to raise_exception(Goku::PathConversionError) }
    end

    context "when the path is a spec file" do
      it { expect(spec.to_implementation.full).to eq(implementation.full) }
    end
  end

end
