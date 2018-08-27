require 'rubygems'
require 'rest_client'
require 'cgi'
require 'nokogiri'
url = 'http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=7rUX7QcQCGkomANurxfhEtqcBvggtbMzjuHMWtXkgeaCqfJHpSPBc68DRwq9AGjU5LByexH0Q2FBDdkG50yG5g%3D%3D&id=5'
headers = { :params => { CGI::escape('ServiceKey') => '7rUX7QcQCGkomANurxfhEtqcBvggtbMzjuHMWtXkgeaCqfJHpSPBc68DRwq9AGjU5LByexH0Q2FBDdkG50yG5g%3D%3D',CGI::escape('id') => '1',CGI::escape('numOfRows') => '300' } }
response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers


#doc = Nokogiri::XML(response)
#@block = doc.css("items").map { |node| node.children.text }
doc= Nokogiri::XML(response)
  @country = doc.css("items item").map {|node| 
            node.children.text
        
           
        }
    doc.css('items item').each do |item|
        if item.at_xpath('attention')
           # val=item.at_xpath('attention')
           @val=1
        elsif item.at_xpath('attentionPartial')
           # val=item.at_xpath('attentionPartial')
           @val=2
        elsif item.at_xpath('control')
            #val=item.at_xpath('control')
            @val=3
        elsif item.at_xpath('controlPartial')
           # val=item.at_xpath('controlPartial')
           @val=4
        elsif item.at_xpath('limit')
           # val=item.at_xpath('limit')
           @val=5
        elsif item.at_xpath('limitPartial')
            #val=item.at_xpath('limitPartial')
            @val=6
        
        end
        country=item.at_xpath('countryEnName')
        @country=country.text
        puts @country, @val
    end
        
       #doc.xpath("items/item").each do |node|
        # countryName=doc.search('countryEnName')
         #Safetyapi.create!(:countryEnName => countryName)
       #end
    # @country.each do |country|
         
     #    Safetyapi.create!(:countryEnName => country)
         
   #  end
       
#puts @country
