require "spec_helper"

describe Goku::Factories::Class do

  subject { described_class.new("user_controller") }

  describe "to_s" do
    it "converts the name of the class to a constant" do
      expect(subject.to_s).to include("UserController")
    end

    it "creates a header" do
      expect(subject.to_s).to include("class UserController")
    end

    it "add an 'end' clause" do
      expect(subject.to_s).to include("end")
    end
  end

end
