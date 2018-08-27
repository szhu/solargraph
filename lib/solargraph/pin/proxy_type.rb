module Solargraph
  module Pin
    class ProxyType < Base
      # @param location [Solargraph::Source::Location]
      # @param namespace [String]
      # @param name [String]
      # @param return_type [ComplexType]
      def initialize location, namespace, name, return_type
        super(location, namespace, name, '')
        @return_complex_type = return_type
      end

      def scope
        return_complex_type.scope
      end

      # @param return_type [ComplexType]
      # @return [ProxyType]
      def self.anonymous return_type
        parts = return_type.namespace.split('::')
        namespace = parts[0..-2].join('::').to_s
        name = parts.last.to_s
        ProxyType.new(nil, namespace, name, return_type)
      end
    end
  end
end