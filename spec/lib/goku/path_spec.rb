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
      expect(subject.filename).to eq("class_builder.rb")
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
    context "when the path a spec file" do
      it { expect(spec).to_not be_implementation }
    end

    context "when the path is not a spec file" do
      it { expect(implementation).to be_implementation }
    end
  end

end
