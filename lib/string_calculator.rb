# frozen_string_literal: true

# Adding pry as a debugging purpose
require 'pry'

# The StringCalculator class is responsible for performing
# calculations on strings containing numbers.
# It supports operations such as adding numbers from a
# comma-separated string and handling custom delimiters.
#
# Example usage:
#   calculator = StringCalculator.new
#   result = calculator.add("1,2,3") # => 6
#   result = calculator.add("//;\n1;2") # => 3
#
class StringCalculator
  SPLIT_BY_EXPRESSION = /,|\\n|;/.freeze

  def self.add(numbers)
    return 0 if numbers.empty?

    numbers_without_delimiters = split_by_delimiter(numbers)
    nums = split_by_numbers(numbers_without_delimiters)
    validate_negative_numbers(nums)
    nums.sum
  end

  def self.split_by_delimiter(numbers)
    return numbers unless numbers.start_with?('//')

    _del, numbers = numbers[2..].split("\n", 2)
    numbers
  end

  def self.split_by_numbers(numbers)
    numbers.split(SPLIT_BY_EXPRESSION).map(&:to_i)
  end

  def self.validate_negative_numbers(nums)
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
