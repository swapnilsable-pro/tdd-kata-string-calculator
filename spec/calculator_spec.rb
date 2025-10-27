require_relative '../calculator'

RSpec.describe Calculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(Calculator.add("")).to eq(0)
    end

    it "returns the number for a single number string" do
      expect(Calculator.add("5")).to eq(5)
    end
  end
end