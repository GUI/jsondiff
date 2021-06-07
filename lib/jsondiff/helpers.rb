module JsonDiff
  module Helpers
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def add_op(path:, value:, distinct_path: nil)
        {
          op: :add,
          path: path,
          value: value,
          _distinct_path: distinct_path,
        }
      end

      def remove_op(path:, distinct_path: nil, previous_value: nil)
        {
          op: :remove,
          path: path,
          _distinct_path: distinct_path,
          _previous_value: previous_value,
        }
      end

      def replace_op(path:, value:, distinct_path: nil, previous_value: nil)
        {
          op: :replace,
          path: path,
          value: value,
          _distinct_path: distinct_path,
          _previous_value: previous_value,
        }
      end
    end
  end
end
