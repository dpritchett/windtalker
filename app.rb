require 'sinatra'
require 'digest/sha1'

get '/say/:words' do
  content_type 'audio/wav'
  words = params[:words]
  `echo #{words} | espeak --stdout`
end

get '/' do
  redirect to '/say/hello memtech'
end
