require "pry"
class StringCalculator
    def initialize
        @call_count = 0
    end

    def get_called_count
        @call_count
    end

    def add(integer_string)
        #update call count
        @call_count += 1

        # when integer_string is empty
        return 0 if integer_string.empty?

        numbers, operation = split_string(integer_string)

        numbers = numbers.map(&:to_i).reject { |n| n > 1000 }

        # when integer_string has negative numbers
        parse_negatives(numbers)
        operation == :multiply ? numbers.inject(1, :*) : numbers.sum
    end

    private
    def split_string(integer_string)
        if integer_string.start_with?("//")
            header, nums = integer_string.split("\n", 2)
            delimiters = header.scan(/\[(.*?)\]/).flatten
            delimiters = [header[2]] if delimiters.empty?

            # Check if single delimiter is "*"
            if delimiters.length == 1 && delimiters.first == "*"
                numbers = nums.split("*")
                return [numbers, :multiply]
            end

            regex = Regexp.union(delimiters)
            [nums.split(regex), :sum]
        else
            [integer_string.split(/,|\n/), :sum]
        end
    end

    def parse_negatives(integers)
        negatives = integers.select { |n| n < 0 }
        raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?
    end
end
