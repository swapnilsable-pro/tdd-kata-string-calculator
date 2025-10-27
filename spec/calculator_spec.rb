require_relative '../calculator'

RSpec.describe Calculator do
  let(:calculator) { described_class.new }

  describe ".add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number for a single number string" do
      expect(calculator.add("5")).to eq(5)
    end

    it "returns the sum for a two number string" do
      expect(calculator.add("2,3")).to eq(5)
    end

    it "handles multiple delimiters" do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "handles custom delimiters" do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for negative numbers" do
      expect { calculator.add("1,-2,3") }.to raise_error("negatives not allowed: -2")
    end

    it "handles multiple negative numbers" do
      expect { calculator.add("-1,-2,3") }.to raise_error("negatives not allowed: -1,-2")
    end

    it "ignores numbers greater than 1000" do
      expect(calculator.add("2,1001")).to eq(2)
    end

    it "handles delimiters of any length" do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it "handles multiple custom delimiters" do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end
  end

  describe ".get_called_count" do
    it "returns the number of times add has been called" do
      3.times { calculator.add("1,2") }
      expect(calculator.get_called_count).to eq(3)
    end
  end
end