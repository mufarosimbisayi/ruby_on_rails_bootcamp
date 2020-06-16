require_relative "ft_wikipedia/version"
require 'nokogiri'
require 'open-uri'

class Error < StandardError; end

class Ft_wikipedia
  def initialize
    @links_array = []
  end

  def search(url)
    begin
      rais if !(page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{url}")))
    rescue
      abort "Dead end page reached"
    end
    link = page.xpath("//p/a[starts-with(@href, '/wiki/')] | //li/a[starts-with(@href, '/wiki/')]").first
    unless link.nil?
      link_title = link.attr("title").gsub(" ", "_").downcase.capitalize
      puts link_title
      @links_array.each do |elem|
        if elem == link_title
          puts "Found loop"
          return "Found loop"
        end
      end
      @links_array.push(link_title)
      search(link_title) unless  @links_array.include?("Philosophy")
    end
  end
end

