class Array
   def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        selected = []

        self.my_each do |item|
            selected << item if prc.call(item)
        end
        selected
    end

    def my_reject(&prc)
        rejected = []

        self.my_each do |item|
            rejected << item if !prc.call(item)
        end
        rejected
    end

    def my_any?(&prc)
        self.my_each do |item|
            return true if prc.call(item)
        end
        false
    end

    def my_flatten
        flattened = []

        self.my_each do |ele|
            if ele.is_a?(Array)
                flattened.concat(ele.my_flatten)
            else
                flattened << ele
            end
        end
        flattened
    end

    def my_zip(*args)
        zipped = []
        self.length.time do |i|
            subzip = [self[i]]
            args.my_each do |array|
                subzip << array[i]
            end
            zipped << subzip
        end
        zipped
    end

    def my_rotate(positions = 1)
        split_idx = positions % self.length
        self.drop(split_idx) + self.take(split_idx)
    end

    def my_join(separator = "")
        join = ""
        self.length.times do |i|
            join += self[i]
            join += separator unless i == self.length - 1
        end
        join
    end

    def my_reverse
        reversed = []
        self.my_each do |ele|
            reversed.unshift(ele)
        end
        reversed
    end
end