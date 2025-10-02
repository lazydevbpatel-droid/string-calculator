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
        integers = split_string(integer_string).map(&:to_i).reject { |n| n > 1000 }
        parse_negatives(integers)

        # when integer_string has more than 1 integer empty
        split_string(integer_string).map(&:to_i).reject { |n| n > 1000 }.sum
    end

    private
    def split_string(integer_string)
        if integer_string.start_with?("//")
            header, nums = integer_string.split("\n", 2)
            delimiters = header.scan(/\[(.*?)\]/).flatten
            if delimiters.empty?
                delimiters = [header[2]]
            end
            regex = Regexp.union(delimiters)
            nums.split(regex)
        else
            integer_string.split(/,|\n/)
        end
    end

    def parse_negatives(integers)
        negatives = integers.select { |n| n < 0 }
        raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?
    end
end
