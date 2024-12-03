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
  SPLIT_BY_EXPRESSION = /,|\\n/.freeze

  class << self 
    def add(numbers)
      return 0 if numbers.empty?

      nums = fetch_splitted_values(numbers)
      nums.sum
    end

    def multiply(numbers)
      return 0 if numbers.empty?

      nums = fetch_splitted_values(numbers)
      nums.inject(:*) 
    end

    def fetch_splitted_values(numbers)
      numbers, del = split_by_delimiter(numbers)
      nums = split_by_numbers(numbers, del)
      validate_negative_numbers(nums)
      nums
    end

    def split_by_delimiter(numbers)
      return [numbers] unless numbers.start_with?('//')

      del, numbers = numbers[2..].split("\n", 2)
      [numbers.split(del).map(&:to_i), del]
    end

    def split_by_numbers(numbers, del)
      return  numbers unless del.nil?

      numbers.split(SPLIT_BY_EXPRESSION).map(&:to_i)
    end


    def  validate_negative_numbers(nums)
      negatives = nums.select(&:negative?)
      raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    end
  end
end
