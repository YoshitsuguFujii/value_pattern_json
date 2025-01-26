module Values
  module Genre
    class Base
      attr_reader :type

      def id
        uuid
      end

      def uuid
        @uuid ||= SecureRandom.uuid
      end
    end
  end
end
