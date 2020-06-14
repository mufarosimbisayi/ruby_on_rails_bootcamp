require_relative "ft_wikipedia/version"
require 'nokogiri'
require 'open-uri'

class Error < StandardError; end

class Ft_wikipedia
  def initialize
    @links_array = []
  end

  def diff_test(url)
    page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{url}"))
    #link = page.xpath("//p/a[starts-with(@href, '/wiki/')]").first
    link = page.xpath("//div[@role != 'note']/a[starts-with(@href, '/wiki/')]").first
    puts link
   # link_title = link.attr("title").gsub(" ", "_").downcase.capitalize unless link.nil?
   # puts link_title unless link.nil?
   # @links_array.push(link_title) unless link.nil?
   # abort if @links_array.size > 3
   # diff_test(link_title) unless link.nil?
  end

  def get_links(url)
    Nokogiri::HTML(open(url).read).css("a").map do |link|
      if (href = link.attr("href"))
        puts link.attr("title")
      end
    end.compact
  end
end

ft_wikipedia = Ft_wikipedia.new
ft_wikipedia.diff_test("Kiss")
