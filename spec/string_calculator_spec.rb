# frozen_string_literal: true

require 'string_calculator'
RSpec.describe StringCalculator do
  describe '.add' do
    context 'when without delimiters' do
      it 'returns 0 for an empty string' do
        expect(StringCalculator.add('')).to eq(0)
      end

      it 'returns the number itself for a single number' do
        expect(StringCalculator.add('1')).to eq(1)
      end

      it 'returns the sum of two numbers' do
        expect(StringCalculator.add('1,2')).to eq(3)
      end

      it 'returns the sum of any amount of numbers' do
        expect(StringCalculator.add('1,2,3,4,5')).to eq(15)
      end

      it 'returns large numbers correctly' do
        expect(StringCalculator.add('1000,2000,3000')).to eq(6000)
      end

      it 'returns numbers with leading zeros' do
        expect(StringCalculator.add('01,02,003')).to eq(6)
      end

      it 'should handles numbers with spaces correctly' do
        expect(StringCalculator.add('1, 2 , 3')).to eq(6)
      end
    end

    context 'when with delimiters' do
      it 'should handles newline as delimiters' do
        expect(StringCalculator.add('1\n2,3')).to eq(6)
      end

      it 'should supports custom delimiters' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it 'should supports multiple custom delimiters' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
        expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
        expect(StringCalculator.add("//$\n1$2$3$4")).to eq(10)
      end

      it 'should returns 0 for corner case delimeter' do
        expect(StringCalculator.add("//;\n")).to eq(0)
      end

      it 'should supports delimiters specified at the start of the input' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it 'should handles a large number of inputs' do
        input = Array.new(1001, 1).join(',')
        expect(StringCalculator.add(input)).to eq(1001)
      end
    end

    context 'when incorrect input' do
      it 'should raises an exception for negative numbers' do
        expect { StringCalculator.add('1,-2,3,-4') }.to raise_error('negative numbers not allowed: -2, -4')
      end

      it 'should raises an exception for a single negative number' do
        expect { StringCalculator.add('1,-2,3') }.to raise_error('negative numbers not allowed: -2')
      end

      it 'should raises an exception if all numbers are negative' do
        expect { StringCalculator.add('-1,-2,-3') }.to raise_error('negative numbers not allowed: -1, -2, -3')
      end
    end

    context 'when custom delimeter with *' do
      it "should return multiplied value" do
        expect(StringCalculator.multiply("//*\n1*2")).to eq(2)
      end
    end
  end
end
