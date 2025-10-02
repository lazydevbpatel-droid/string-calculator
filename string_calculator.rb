class StringCalculator
    def add(integer_string)
        # when integer_string is empty
        return 0 if integer_string.empty?

        delimiter = /,|\n/

        # when integer_string has negative numbers
        integer_array = integer_string.split(delimiter).map(&:to_i)
        negatives = integer_array.select { |n| n < 0 }
        raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

        # when integer_string has more than 1 integer empty
        if integer_string.start_with?("//")
            parts = integer_string.split("\n", 2)
            delimiter = Regexp.new(Regexp.escape(parts[0][2..]))
            integer_string = parts[1]
        end

        integer_string.split(delimiter).map(&:to_i).sum
    end
end
