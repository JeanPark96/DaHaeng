
class ApiController < ApplicationController
    def index
        require 'rubygems'
        require 'rest_client'
        require 'cgi'
        require 'nokogiri'
        url = 'http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=7rUX7QcQCGkomANurxfhEtqcBvggtbMzjuHMWtXkgeaCqfJHpSPBc68DRwq9AGjU5LByexH0Q2FBDdkG50yG5g%3D%3D&id=5'
        headers = { :params => { CGI::escape('ServiceKey') => '7rUX7QcQCGkomANurxfhEtqcBvggtbMzjuHMWtXkgeaCqfJHpSPBc68DRwq9AGjU5LByexH0Q2FBDdkG50yG5g%3D%3D',CGI::escape('id') => '1',CGI::escape('numOfRows') => '20' } }
        response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
        
        
        doc = Nokogiri::XML(response)
        @block = doc.css("items item countryEnName").map { |node| node.children.text }
        
        
        
       #doc.xpath("items/item/countryEnName").each do |node|
         #   Safetyapi.new(:items => node.text).save
      # end
       @block.each do |country|
           Safetyapi.create(items: country)
       end
    end
    
end
