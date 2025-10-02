class StringCalculator
    def add(integer_string)
        return 0 if integer_string.empty?
        return integer_string.to_i if integer_string.length == 1
    end
end
