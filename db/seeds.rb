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

