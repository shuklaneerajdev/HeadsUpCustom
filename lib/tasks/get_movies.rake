require 'nokogiri'
require 'open-uri'
task import_list: :environment do |t|
  # Fetch and parse HTML document
  imdb_link_page = ENV['MOVIE_LIST']
  imdb_link_page = "https://www.imdb.com/list/ls009636458/?ref_=otl_4&sort=list_order,asc&st_dt=&mode=detail&page=2"
  doc = Nokogiri::HTML(open(imdb_link_page))

  puts "### Search for nodes by css"
  doc.css('.lister-item-header a').each do |link|
    puts "****************************************"
    puts link.content
    begin
      Movie.create!(title: link.content)
    rescue ActiveRecord::ActiveRecordError
      puts "Could not insert record."
    end
    puts "****************************************"
  end
end
