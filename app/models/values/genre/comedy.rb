module Values
  module Genre
    class Comedy < Base
      include ActiveModel::Model

      # 笑いのタイプ、ユーモアの国別傾向
      attr_reader :humor_type, :cultural_bias

      # 必須の設定
      validates :humor_type, presence: true

      def initialize(humor_type: nil, cultural_bias: nil, uuid: nil)
        @humor_type = humor_type
        @cultural_bias = cultural_bias
        @uuid = uuid
      end

      def as_json(_options = nil)
        {
          type: "Comedy",
          humor_type:,
          cultural_bias:,
          uuid:
        }
      end
    end
  end
end
