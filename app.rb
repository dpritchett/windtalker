require 'sinatra'

set :bind, '0.0.0.0'

get '/say/:words' do
  content_type 'audio/wav'

  words   = params[:words].gsub(/[^\w]/, ' ')
  raw_wav = `echo #{words} | espeak -v whisper --stdout`

  `echo #{words} | espeak --stdout`
end

get '/' do
  redirect to '/say/hello memtech'
end
