require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie_hash|
    Movie.create!(
        overview: movie_hash["overview"],
        poster_url: movie_hash["poster_path"],
        rating: movie_hash["vote_average"],
        title: movie_hash["title"]
    )
end

Movie.all
# user.
# puts "#{}"


#       t.text :overview
#       t.string :poster_url
#       t.float :rating