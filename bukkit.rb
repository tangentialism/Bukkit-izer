require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'

get '/' do
  doc = Nokogiri::HTML(open('http://bukk.it'))
  bukkits = doc.css('tr > td > a').collect(&:content)
  redirect "http://bukk.it/#{bukkits.sample}" 
end
