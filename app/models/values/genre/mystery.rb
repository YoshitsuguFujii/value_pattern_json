module Values
  module Genre
    class Mystery < Base
      include ActiveModel::Model

      # 怖さ指数、年齢制限、謎の難易度
      attr_accessor :scare_level, :age_restriction, :puzzle_difficulty

      # 必須の設定
      validates :scare_level, :age_restriction, presence: true
      validates :scare_level, numericality: true
      validates :age_restriction, inclusion: {
        in: [ "12+", "15+", "18+" ],
        message: "%{value} は有効な年齢制限ではありません"
      }

      def initialize(scare_level: nil, age_restriction: nil, puzzle_difficulty: nil, uuid: nil)
        @scare_level = scare_level
        @age_restriction = age_restriction
        @puzzle_difficulty = puzzle_difficulty
        @uuid = uuid
      end

      def adult_content?
        @age_restriction == "18+" || @age_restriction == "15+"
      end

      def as_json(_options = nil)
        {
          type: "Mystery",
          scare_level:,
          age_restriction:,
          puzzle_difficulty:,
          uuid:
        }
      end
    end
  end
end
