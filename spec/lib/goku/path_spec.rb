require "spec_helper"

describe Goku::Path do

  subject { described_class.new("lib/goku/builders/class_builder.rb") }

  describe "#directories" do
    it "returns all the directories in the path" do
      expect(subject.directories).to eq([
        "lib",
        "goku",
        "builders"
      ])
    end
  end

  describe "#filename" do
    it "returns the name of the file" do
      expect(subject.filename).to eq("class_builder.rb")
    end
  end
end
