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
    end

    context 'when with delimiters' do
      it 'should handles newline as delimiters' do
        expect(StringCalculator.add('1\n2,3')).to eq(6)
      end

      it 'should supports custom delimiters' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when incorrect input' do
      it 'should raises an exception for negative numbers' do
        expect { StringCalculator.add('1,-2,3,-4') }.to raise_error('negative numbers not allowed: -2, -4')
      end
    end
  end
end
