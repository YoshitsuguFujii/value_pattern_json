module GenreAddable
  extend ActiveSupport::Concern

  included do
    serialize :genre, coder: Serializers::GenreSerializer

    validate :validate_genre
  end

  # ジャンル「ミステリー」を追加
  def add_mystery
    self.genre ||= []
    self.genre << Values::Genre::Mystery.new
  end

  # ジャンル「コメディ」を追加
  def add_comedy
    self.genre ||= []
    self.genre << Values::Genre::Comedy.new
  end

  private

  def validate_genre
    return if genre.map(&:valid?).all?

    errors.add(:base, "ジャンルにエラーがあります")
  end
end
