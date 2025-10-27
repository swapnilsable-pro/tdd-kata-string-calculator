class Calculator
  def self.add(numbers)
    return 0 if numbers.empty?

    parsed_numbers(numbers).sum
  end

  def self.parsed_numbers(numbers)
    numbers.split(/[,\n]/).map(&:to_i)
  end
end