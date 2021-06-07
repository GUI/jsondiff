module JsonDiff
  class ArrayDiff
    include Helpers

    def self.generate(result, prefix, array1, array2, unindexed_prefix: nil)
      if array1.size < array2.size
        array2[(array1.size..array2.size)].each_with_index do |value, index|
          index += array1.size
          result << add_op(path: "#{prefix}/#{index}", value: value, unindexed_path: "#{unindexed_prefix || prefix}/*")
        end
      elsif array1.size > array2.size
        array1[(array2.size..array1.size)].reverse.each_with_index do |value, index|
          index = array1.size - 1 - index
          result << remove_op(path: "#{prefix}/#{index}", previous_value: array1[index], unindexed_path: "#{unindexed_prefix || prefix}/*")
        end
      end
      array2.each_with_index do |value, index|
        if array1.size > index && array1[index] != value
          JsonDiff.generate(array1[index], value, result, "#{prefix}/#{index}", unindexed_prefix: "#{unindexed_prefix || prefix}/*")
        end
      end
    end
  end
end
