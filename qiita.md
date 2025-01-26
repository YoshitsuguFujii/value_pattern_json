# Valueオブジェクトパターン(JSON編)

アドベントカレンダーで[Valueオブジェクトパターン](https://yoshitsugufujii.github.io/blog/2024/11/03/value-object-pattern/)というプリミティブ型をオブジェクトでラップするテクニックを紹介しました。
そこで最後にjson編を書くかもねと宣言していたので、今回は前回の続きでjson編です。

# 要件

本、映画、VOD(Netflix, Huluなど)の作品を紹介するサービスがあったとします。
本、映画、VODは別々のテーブル、モデルで定義されています。
それぞれにジャンルに応じたメタ情報を持ちたいです。

| ジャンル | 独自の項目 |
|---------|---------|
| ミステリー        | 怖さ指数、年齢制限、謎の難易度        |
| コメディ        |  笑いのタイプ       | 
| アクション        | アクションの頻度、暴力度、スリル度        |
| ドキュメンタリー        | 社会的メッセージ性、教育性価値        |

ジャンルごとに持つメタ情報は本、映画、VODで共通です。
そしてジャンルはひとつだけではなく、複数持ちます。
特に映画ではコメディとアクションの組み合わせはよくあります。























# Movieの作成
movie = Movie.create(title: "The Godfather", director: "Francis Ford Coppola", release_year: 1972, studio: "Paramount")
work = Work.create(title: movie.title, category: "Movie", category_id: movie.id)

# Bookの作成
book = Book.create(title: "1984", author: "George Orwell", publish_year: 1949, publisher: "Penguin")
work = Work.create(title: book.title, category: "Book", category_id: book.id)

# VODの作成
vod = Vod.create(title: "Stranger Things", creator: "Duffer Brothers", start_year: 2016, platform: "Netflix")
work = Work.create(title: vod.title, category: "VOD", category_id: vod.id)



以下は、Mystery と Comedy のジャンルを PORO（Plain Old Ruby Object） として定義する例です。それぞれ独自の属性を持ち、初期化時に値を設定できるようにします。

✅ Mystery PORO
ruby
コピーする
編集する
class Mystery
  attr_accessor :scare_level, :age_restriction, :puzzle_difficulty

  # コンストラクタで属性を初期化
  def initialize(scare_level:, age_restriction:, puzzle_difficulty:)
    @scare_level = scare_level
    @age_restriction = age_restriction
    @puzzle_difficulty = puzzle_difficulty
  end

  # 表示用のメソッド
  def details
    "Mystery - Scare Level: #{@scare_level}, Age Restriction: #{@age_restriction}, Puzzle Difficulty: #{@puzzle_difficulty}"
  end
end
✅ Comedy PORO
ruby
コピーする
編集する
class Comedy
  attr_accessor :humor_type, :cultural_bias

  # コンストラクタで属性を初期化
  def initialize(humor_type:, cultural_bias:)
    @humor_type = humor_type
    @cultural_bias = cultural_bias
  end

  # 表示用のメソッド
  def details
    "Comedy - Humor Type: #{@humor_type}, Cultural Bias: #{@cultural_bias}"
  end
end
✅ 使用例
ruby
コピーする
編集する
# Mysteryオブジェクトの作成
mystery = Mystery.new(
  scare_level: 4,
  age_restriction: "15+",
  puzzle_difficulty: "中級"
)

# Comedyオブジェクトの作成
comedy = Comedy.new(
  humor_type: "ブラックコメディ",
  cultural_bias: "アメリカ"
)
