require 'nokogiri'
require 'open-uri'
task import_list: :environment do |t|
  # Fetch and parse HTML document
  doc = Nokogiri::HTML(open('https://www.imdb.com/list/ls063524796/?ref_=otl_2'))

  puts "### Search for nodes by css"
  doc.css('.lister-item-header a').each do |link|
    puts "****************************************"
    puts link.content
    Movie.create!(title: link.content)
    puts "****************************************"
  end
end
