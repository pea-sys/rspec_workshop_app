# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # @example
      #   # bad
      #   if x == 1
      #     do_something1
      #   elsif y == 2
      #     do_something2
      #   end
      #
      #   # good
      #   case
      #   when x == 1
      #     do_something1
      #   when y == 2
      #     do_something2
      #   end
      #
      #   # good
      #   case x
      #   when (1..20)
      #     do_something1
      #   when (21..)
      #     do_something2
      #   end
      #
      class ReplaceElsif < Base
        MSG = "`elsif` can be replace with `case`."

        def on_if(node)
          return unless node.elsif?

          add_offense(node)
        end
      end
    end
  end
end