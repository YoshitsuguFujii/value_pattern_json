class Movie < ApplicationRecord
  include GenreAddable

  validates :title, presence: true
end
