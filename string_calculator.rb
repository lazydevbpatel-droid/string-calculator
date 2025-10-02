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

        delimiter = /,|\n/

        # when integer_string has negative numbers
        integers = split_string(integer_string, delimiter).map(&:to_i)
        parse_negatives(integers)

        # when integer_string has more than 1 integer empty
        if integer_string.start_with?("//")
            parts = split_string(integer_string, "\n", 2)
            delimiter = Regexp.new(Regexp.escape(parts[0][2..]))
            integer_string = parts[1]
        end

        split_string(integer_string, delimiter).map(&:to_i).sum
    end

    private
    def split_string(input, delimiter, limit = 0)
        input.split(delimiter, limit)
    end

    def parse_negatives(integers)
        negatives = integers.select { |n| n < 0 }
        raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?
    end
end
