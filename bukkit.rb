require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'

get '/' do
  bukkits = get_bukkits()
  redirect "http://bukk.it/#{bukkits.sample}" 
end

get '/*.:format' do
  bukkits = get_bukkits()
  pretties = bukkits.select do |b|
    /\.#{params[:format]}/.match b
  end
  redirect "http://bukk.it/#{pretties.sample}" 
end

def get_bukkits
  doc = Nokogiri::HTML(open('http://bukk.it'))
  bukkits = doc.css('tr > td > a').collect(&:content)
end

