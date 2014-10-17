#http://ruby.bastardsbook.com/chapters/web-crawling/

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

BASE_WIKIPEDIA_URL = "http://en.wikipedia.org"
LIST_URL = "#{BASE_WIKIPEDIA_URL}/wiki/List_of_Nobel_laureates"
page = Nokogiri::HTML(open(LIST_URL))
rows = page.css('div.mw-content-ltr table.wikitable tr')         

rows[1..-2].each do |row|
  hrefs = row.css("td a").map{ |a| 
    a['href'] if a['href'].match("/wiki/")
  }.compact.uniq

  hrefs.each do |href|
   puts href
  end
 
 hrefs.each do |href|
    remote_url = BASE_WIKIPEDIA_URL + href
    puts remote_url    
  end # done: hrefs.each

end # done: rows.each