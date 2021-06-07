module JsonDiff
  module Helpers
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def add_op(path:, value:, unindexed_path: nil)
        {
          op: :add,
          path: path,
          value: value,
          _unindexed_path: unindexed_path,
        }
      end

      def remove_op(path:, unindexed_path: nil, previous_value: nil)
        {
          op: :remove,
          path: path,
          _unindexed_path: unindexed_path,
          _previous_value: previous_value,
        }
      end

      def replace_op(path:, value:, unindexed_path: nil, previous_value: nil)
        {
          op: :replace,
          path: path,
          value: value,
          _unindexed_path: unindexed_path,
          _previous_value: previous_value,
        }
      end
    end
  end
end
