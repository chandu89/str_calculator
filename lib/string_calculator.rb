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
#   result = calculator.add("//*\n1*2") # => 1*2
#
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    numbers, del = split_by_delimiter(numbers)
    validate_negative_numbers(numbers)
    del == '*' ? numbers.inject(:*) : numbers.sum
  end

  def self.split_by_delimiter(numbers)
    unless numbers.start_with?('//')
     return [numbers.split(',').map(&:to_i), 0]
    end

    del, numbers = numbers[2..].split("\n", 2)
    [numbers.split(del).map(&:to_i), del]
  end

  
  def self.validate_negative_numbers(nums)
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
