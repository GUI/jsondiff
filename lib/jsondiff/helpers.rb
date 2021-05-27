module JsonDiff
  module Helpers
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def add_op(prefix, key, value)
        {op: :add, path: "#{prefix}/#{key}", value: value}
      end

      def remove_op(prefix, key, previous_value)
        {op: :remove, path: "#{prefix}/#{key}", previous_value: previous_value}
      end

      def replace_op(prefix, value, previous_value)
        {op: :replace, path: prefix, value: value, previous_value: previous_value}
      end
    end
  end
end
