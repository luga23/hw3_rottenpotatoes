class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.find_with_same_director( id )
    movies = []
    
    movie = Movie.find_by_id(id)
    if movie && !movie.director.nil? && !movie.director.empty?
      movies = Movie.find_all_by_director(movie.director)       
    end
    
    movies
  end
end
