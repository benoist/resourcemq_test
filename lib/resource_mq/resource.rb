module ResourceMQ
  module Resource
    extend ActiveSupport::Concern
    include Message

    class Builder
      attr_accessor :resource

      def initialize(resource)
        @resource = resource
      end

      def attribute(*args)

      end

      def collection(*args)

      end
    end

    module ClassMethods
      def resource(name, &block)
        @resource_builder = Builder.new(self)
        @resource_builder.instance_exec &block
      end
    end
  end
end
