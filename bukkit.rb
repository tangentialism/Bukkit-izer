require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'

BUKKIT_BUCKET = []

get '/' do
  bukkits = get_bukkits()
  redirect "http://bukk.it/#{bukkits.sample}" 
end

get '/favicon.ico' do
  return 404 # come on.
end

get '/:matchword.:format' do
  bukkits = get_bukkits()
  pretties = bukkits.select do |b|
    match_word_and_format(params[:matchword], params[:format], b)
  end
  if pretties.length < 1
    return 404
  end
  redirect "http://bukk.it/#{pretties.sample}" 
end

# SECRET SAUCE PATENT PENDING

def get_bukkits
  if BUKKIT_BUCKET.empty?
    doc = Nokogiri::HTML(open('http://bukk.it'))
    BUKKIT_BUCKET = doc.css('tr > td > a').collect(&:content)
  end
  return BUKKIT_BUCKET
end

def match_word_and_format(word, format, b)
  if format
    if word == 'index'
      return b.match ".#{format}"
    else
      return b.match(".#{format}") && b.match("#{word}")
    end
  else
    unless word == 'index'
      return b.match "#{word}"
    end
  end
end
