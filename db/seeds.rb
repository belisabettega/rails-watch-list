# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all

require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie_hash|
    movie = Movie.create!(
        overview: movie_hash["overview"],
        poster_url: "https://image.tmdb.org/t/p/w300#{movie_hash['poster_path']}",
        rating: movie_hash["vote_average"],
        title: movie_hash["title"]
    )
end
