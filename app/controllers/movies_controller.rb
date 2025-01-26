class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new

    # formで選択したジャンルに応じて動的に入力欄を出すのが正しいだけど、
    # そこまで実装するとコードが煩雑になってノイズになるのでミステリーとコメディがを選んだものとする
    # add_mysteryかadd_comedyを消すと入力欄も消えるのでお試しあれ
    @movie.add_mystery
    @movie.add_comedy
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    movie_params = params.fetch(:movie, {})
    movie_params[:genre] = movie_params.fetch(:genre, {}).values

    movie_params.permit(
      :title,
      :director,
      :release_year,
      :studio,

      # この辺りはダラダラかくとどの項目がどの値オブジェクトのものかわからなくて保守性が低いので
      # 許可するリストはモデルに持たせるほうがいいです
      genre: [
        :type,
        :scare_level,
        :age_restriction,
        :puzzle_difficulty,
        :humor_type,
        :cultural_bias
      ]
    )
  end
end
