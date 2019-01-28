
require 'gossip'
class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

get '/gossips/new/' do
    erb :new_gossip
  end

  
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"] , params["gossip_content"]).save
redirect '/'
end

 get '/gossips/' do
    erb :gossips, locals: {gossips: Gossip.all}
  end

   get '/gossips/:id/' do
    id = params[:id].to_i
    Gossip.find(id)
    erb :show, locals: {gossips: Gossip.find(id), id: id}
  end
end