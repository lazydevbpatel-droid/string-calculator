class StringCalculator
    def add(integer_string)
        # when integer_string is empty
        return 0 if integer_string.empty?

        # when integer_string has more than 1 integer empty
        integer_string.split(/,|\n/).map(&:to_i).sum
    end
end
