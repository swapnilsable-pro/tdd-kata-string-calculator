class Calculator
  def initialize
    @call_count = 0
  end

  def add(numbers)
    @call_count += 1
    return 0 if numbers.empty?

    parsed_numbers(numbers).sum
  end

  def get_called_count
    @call_count
  end

  private

  def parsed_numbers(numbers)
    delimiter = ",|\n"
    if numbers.start_with?("//")
      delimiter_spec, numbers = numbers.split("\n", 2)
      delimiter = Regexp.escape(delimiter_spec[2..])
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = nums.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(',')}" if negatives.any?

    nums
  end
end