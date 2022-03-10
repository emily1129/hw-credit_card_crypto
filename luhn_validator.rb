# frozen_string_literal: true

# Validates credit card number using Luhn Algorithm
module LuhnValidator
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    sum = nums_a[0...-1]
          .reverse
          .each_with_index
          .reduce(0) do |start, (digit, index)|
            start + cal_digit(digit, index)
          end
    nums_a[-1] == (10 - sum % 10) % 10
  end

  def cal_digit(digit, index)
    (index.even? ? digit * 2 : digit).digits.reduce { |d1, d2| d1 + d2 }
  end
end
