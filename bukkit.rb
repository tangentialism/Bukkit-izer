require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'

@@bukkit_bucket = []

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

get '/:matchword' do
  bukkits = get_bukkits()
  pretties = bukkits.select do |b|
    match_word_and_format(params[:matchword], nil, b)
  end
  if pretties.length < 1
    return 404
  end
  redirect "http://bukk.it/#{pretties.sample}" 
end

# SECRET SAUCE PATENT PENDING

def get_bukkits
  if @@bukkit_bucket.empty?
    doc = Nokogiri::HTML(open('http://bukk.it'))
    @@bukkit_bucket = doc.css('tr > td > a').collect(&:content)
  end
  return @@bukkit_bucket
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
