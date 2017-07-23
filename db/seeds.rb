# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faraday'

class Seed
  def id_range
    range = (105748391..105748591).to_a
    range.join(",")
  end

  def consume_api
    response = Faraday.get("https://www.mountainproject.com/data?action=getRoutes&routeIds=#{id_range}&key=200112807-0bf6fdd00a09c4091f73f98f033dd1a0")
    raw_data = response.body
    JSON.parse(raw_data)
  end

  def test_consume_api
    response = Faraday.get("https://www.mountainproject.com/data?action=getRoutes&routeIds=105748391&key=200112807-0bf6fdd00a09c4091f73f98f033dd1a0")
    raw_data = response.body
    test_data = JSON.parse(raw_data)
  end

  def create_route
    consume_api["routes"].each do |route|
      current_route = Route.create!(route_name: route["name"], description: route["type"], rating_id: Rating.create!(number: route["rating"]).id, pitch_id: Pitch.create!(number: route["pitches"]).id, location_id: Location.create!(region: route["location"][2], city: route["location"][1], state: route["location"][0]).id)
      Routesquality.create!(average_quality: route["stars"], star_count: route["starVotes"], route_id: current_route.id, quality_id: Quality.create!(star_value: 4).id)
    end
  end
end
seed = Seed.new
seed.create_route
