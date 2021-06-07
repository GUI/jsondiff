module JsonDiff
  class HashDiff
    include Helpers

    def self.generate(result, prefix, hash1, hash2, distinct_prefix: nil)
      hash2.each do |key, value|
        path = "#{prefix}/#{key}"
        distinct_path = "#{distinct_prefix || prefix}/#{key}"
        if !hash1.has_key? key
          result << add_op(path: path, value: value, distinct_path: distinct_path)
        else
          value2 = hash1[key]
          if value != value2
            JsonDiff.generate(value2, value, result, path, distinct_prefix: distinct_prefix)
          end
        end
      end
      hash1.each do |key, value|
        unless hash2.has_key? key
          path = "#{prefix}/#{key}"
          distinct_path = "#{distinct_prefix || prefix}/#{key}"
          result << remove_op(path: path, distinct_path: distinct_path, previous_value: value)
        end
      end
      result
    end
  end
end
