require 'sinatra'
require 'zlib'

get '/say/:words' do
  content_type 'audio/wav'

  words   = params[:words].gsub(/[^\w]/, ' ')
  raw_wav = `echo #{words} | espeak -v whisper --stdout`

  headers['Content-Encoding'] = 'gzip'

  StringIO.new.tap do |io|
    gz = Zlib::GzipWriter.new(io)
    begin
      gz.write(raw_wav)
    ensure
      gz.close
    end
  end.string
end

get '/' do
  redirect to '/say/hello memtech'
end
