require_relative '../calculator'

RSpec.describe Calculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(Calculator.add("")).to eq(0)
    end

    it "returns the number for a single number string" do
      expect(Calculator.add("5")).to eq(5)
    end

    it "returns the sum for a two number string" do
      expect(Calculator.add("2,3")).to eq(5)
    end

    it "handles multiple delimiters" do
      expect(Calculator.add("1\n2,3")).to eq(6)
    end

    it "handles custom delimiters" do
      expect(Calculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for negative numbers" do
      expect { Calculator.add("1,-2,3") }.to raise_error("negatives not allowed: -2")
    end
  end
end