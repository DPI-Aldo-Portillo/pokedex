require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require "debug"

get("/") do
  erb :home
end

get("/pokedex") do
  erb :pokedex
end

get("/pokedex/:name") do
  @name = params[:name]

  API = "https://pokeapi.co/api/v2/pokemon/#{@name}"

  req = HTTP.get(API)

  @res = JSON.parse(req)

  @name = @res["name"]

  @moves = @res.dig("moves")

  @photo = @res.dig("sprites", "front_default")

  @weight = @res.dig("weight")

  erb :pokedex
end
