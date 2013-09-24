module Sprockets
  module AMD
    module DirectiveProcessor

      def process_define_directive(path, inherit = true)
        binding.pry
        if context.content_type == 'application/javascript'
          raise "found define directive #{path.inspect}"
        end
      end

      def process_depend_directive(path, inherit = true)
        if context.content_type == 'application/javascript'
          raise "found depend directive #{path.inspect}"
        end
      end

      def process_package_directive(path, inherit = true)
        if context.content_type == 'application/javascript'
          raise "found package directive #{path.inspect}"
        end
      end

    end
  end
end