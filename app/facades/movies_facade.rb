class MoviesFacade
  def self.top_40_movies
    page1 = MoviesService.get_data('movie/top_rated')
    page2 = MoviesService.get_data('movie/top_rated?page=2')
    results = page1[:results] + page2[:results]
    create_movies(results)
  end

  def self.now_playing
    results = MoviesService.get_data('movie/now_playing')[:results]
    create_movies(results)
  end

  def self.similar_movies(id)
    results = MoviesService.get_data("movie/#{id}/similar")[:results]
    create_movies(results[0..2])
  end

  def self.find_movie_by_title(title)
    page1 = MoviesService.get_data("search/movie?query=#{title}")
    page2 = MoviesService.get_data("search/movie?query=#{title}&page=2")
    results = page1[:results] + page2[:results]
    create_movies(results)
  end

  def self.create_movies(movie_data)
    movie_data.map do |data|
      Movie.new(data)
    end
  end

  def self.find_movie_by_id(id)
    parsed_movie_data = MoviesService.get_data("movie/#{id}")
    Movie.new(parsed_movie_data)
  end

  def self.cast_by_id(id)
    parsed_cast_data = MoviesService.get_data("movie/#{id}/credits")
    parsed_cast_data[:cast][0..9].map do |member|
      CastMember.new(member)
    end
  end

  def self.reviews_by_id(id)
    parsed_review_data = MoviesService.get_data("movie/#{id}/reviews")
    parsed_review_data[:results].map do |result|
      Review.new(result)
    end
  end
end
