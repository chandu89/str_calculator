# String Calculator - TDD Kata

Implement a simple String calculator that can handle summing numbers represented as a string in various formats. 

---
### Input/Output:

```ruby
class StringCalculator
  def self.add(string)
    # returns the sum of numbers
  end
end

StringCalculator.add("")  # => 0
StringCalculator.add("1")  # => 1
StringCalculator.add("1,5")  # => 6
StringCalculator.add("1\n2,3")  # => 6
StringCalculator.add("//;\n1;2")  # => 3
StringCalculator.add("1,-2,3")  # => raises an exception: "negative numbers not allowed: -2"

```

# Setup
To get started with this project, clone the repository and install the necessary dependencies.

### Clone the repository:
```
git clone https://github.com/chandu89/str_calculator.git
cd str_calculator
bundle install
```

### Run tests(rspec):
```
bundle exec rspec
```

### Test is 100% covered with lint free code

<img width="1257" alt="image" src="https://github.com/user-attachments/assets/4cc9f35f-55fa-41c2-9108-aa9e28eb7de4">
