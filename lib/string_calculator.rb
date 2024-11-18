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

    if numbers.start_with?('//')
      delimiter, numbers = numbers[2..].split("\n", 2)
      numbers.split(delimiter).map(&:to_i).sum
    else
      numbers.split(SPLIT_BY_EXPRESSION).map(&:to_i).sum
    end
  end
end
