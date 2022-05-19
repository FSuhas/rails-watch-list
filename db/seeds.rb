require 'open-uri'
require 'json'

Movie.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"

poster_serial = URI.open(url).read

result = JSON.parse(poster_serial)


p "Start ..."

result["results"].each do |r|
  p "Create #{r['original_title']}"
  Movie.create(title: r['original_title'], overview: r['overview'],
  poster_url: "https://image.tmdb.org/t/p/w500#{r['poster_path']}", rating: r['vote_average'])
  p "Finish #{r['original_title']}"
end
