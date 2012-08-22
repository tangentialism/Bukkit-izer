require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'

get '/' do
  bukkits = get_bukkits()
  redirect "http://bukk.it/#{bukkits.sample}" 
end

get '/favicon.ico' do
  return 404
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

def get_bukkits
  doc = Nokogiri::HTML(open('http://bukk.it'))
  bukkits = doc.css('tr > td > a').collect(&:content)
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
