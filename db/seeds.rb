# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


lang=[
['미국',10,15],
['일본',5,8],
['영국',13,6],
['프랑스',8,2],
['베트남',1,1],
['중국',8,3],
]
lang.each do |country,score,visit|
  Lang.create(country: country, score: score, visit: visit)
end


vol=[
['미국',4,2],
['일본',5,3],
['말레이시아',8,3],
['인도',5,5],
['아프리카',7,3],
['베트남',15,10],
['중국',5,6],
]
vol.each do |country,score,visit|
  Vol.create(country: country, score: score, visit: visit)
end

 require 'rubygems'
        require 'rest_client'
        require 'cgi'
        require 'nokogiri'
        url = 'http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=7rUX7QcQCGkomANurxfhEtqcBvggtbMzjuHMWtXkgeaCqfJHpSPBc68DRwq9AGjU5LByexH0Q2FBDdkG50yG5g%3D%3D&id=5'
        headers = { :params => { CGI::escape('ServiceKey') => '7rUX7QcQCGkomANurxfhEtqcBvggtbMzjuHMWtXkgeaCqfJHpSPBc68DRwq9AGjU5LByexH0Q2FBDdkG50yG5g%3D%3D',CGI::escape('id') => '1',CGI::escape('numOfRows') => '237' } }
        response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
        
        
        doc = Nokogiri::XML(response)
        
       @country = doc.css("items item").map {|node| 
            
            node.css('countryEnName').map{|node2|
              node2.text
              
            }
       }    
    doc.css('items item').each do |item|
        if item.at_xpath('attention')
           # val=item.at_xpath('attention')
           @val=1.to_i
        elsif item.at_xpath('attentionPartial')
           # val=item.at_xpath('attentionPartial')
           @val=2.to_i
        elsif item.at_xpath('control')
            #val=item.at_xpath('control')
            @val=3.to_i
        elsif item.at_xpath('controlPartial')
           # val=item.at_xpath('controlPartial')
           @val=4.to_i
        elsif item.at_xpath('limit')
           # val=item.at_xpath('limit')
           @val=5.to_i
        elsif item.at_xpath('limitPartial')
            #val=item.at_xpath('limitPartial')
            @val=6.to_i
        end
        #val = val ? val.text : "DEFAULT"
        country=item.at_xpath('countryEnName')
        country=country.text
        Safetyapi.create!(:countryEnName => country,:val =>@val)
    end
        
        
       #doc.xpath("items/item").each do |node|
        # countryName=doc.search('countryEnName')
         #Safetyapi.create!(:countryEnName => countryName)
       #end
  #   @country.each do |country|
         
   #      Safetyapi.create!(:countryEnName => country)
         
   #  end
       