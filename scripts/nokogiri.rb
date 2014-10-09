require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "http://reddit.com"
page = Nokogiri::HTML(open(PAGE_URL)) 
puts page.class   # => Nokogiri::HTML::Document
puts page.css("title")[0].name + ": " + page.css("title")[0].text 

page.css('p').each do | p |
	if p.text.length < 50 && p.text.length != 0
		puts "[ " + p.text + " ]\n"
		#puts p.text.length
	else
		#puts "Data string too long!"
		
	end
end

#puts page.css('p').text
news_links = page.css("a[data-category=news]")
news_links.each{|link| puts link['href']}
#=>   http://reddit.com
#=>   http://www.nytimes.com

puts news_links.class   #=>   Nokogiri::XML::NodeSet   

links = page.css("a")
puts links.length.to_s + " links found."  # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com