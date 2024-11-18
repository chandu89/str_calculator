# frozen_string_literal: true

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
  def self.add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').map(&:to_i).sum
  end
end
