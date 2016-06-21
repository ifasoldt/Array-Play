#!/usr/bin/ruby
require 'erb'

movies = []
movies << {
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
}

#Explorer #1
our_class = ["Isaiah", "Marie", "Sean", "Daniel"]
#Explorer #2
short_name = our_class.select{|x| x.length < 5}
#Explorer #3
def four_words (str)
  list = str.split.select{|x| x.length == 4}
end
array_four_words = four_words("Ruby is actually kind of fun once you get used to it.")
# sentence = "Ruby is actually kind of fun once you get used to it."
# words_length_four = sentence.split.select{|x| x.length == 4}
#Explorer #4
cheap_movie = movies.select{ |movie| movie[:budget] < 100}.map{|x| x[:title]}
leonardo_movie = movies.select {|movie| movie[:stars].include? "Leonardo DiCaprio"}.map{|x| x[:title]}
#Adventurer 1
# def four_words (str)
#   list = str.split.select{|x| x.length == 4}
# end

#Adventurer 2
def how_many_words(text, num)
  list = text.split.select{|x| x.length == num}
end
how_many_words_example = how_many_words("Ruby is actually kind of fun once you get used to it.", 2)

#Adventurer 3
total_budget = movies.inject(0){|sum, movie| sum += movie[:budget]}
#Epic 1

movies_by_star = []
movie_stars = movies.collect{|k| k[:stars]}
movie_stars.flatten!.uniq!


# movie_stars.each do |y|
#   movies_by_star << {star: y, movies: movies.select {|movie| movie[:stars].include? y}.map{|x| x[:title]}}
# end
# puts movies_by_star
# #
def starring?(arr, name)
  starring_movies = arr.select {|movie| movie[:stars].include? name}.map{|x| x[:title]}
end

movie_stars.each do |y|
  movies_by_star << {star: y, movies: starring?(movies, y)}
end

jgl_starring = starring?(movies, "JGL")

#Epic 1.1
# puts movies_by_star

#Epic 1.2

average_budget = total_budget.to_f / movies.length

#Epic 1.3
budget_list = movies.collect {|k| k[:budget]}
budget_list.sort!
median_budget = budget_list[(budget_list.length/2)]

# movie_stars.each do |x|
#   i = 0
#   while i < movie_stars.length
#     movies.each do |y|
#       if y[:stars] == x
#         movies_by_star << y


#
# movies.each do |x|
#   i = 0
#   while i < movie_stars.length
#     if x[:stars]
# puts movie_stars


# hash.merge(other_hash) { |key, oldval, newval| block }

#Legendary 1 use inject(:+ )

def accumulate(arr, &some_block)
  group = arr.collect{|x| some_block.call(x)}
  total = group.inject(:+)
end

accumulate_i = accumulate([1,2,3,4,5]) {|thing| thing * 4 }
accumulate_s = accumulate([{ phrase: "A string" }, { phrase: " is a terrible thing to taste"}]) { |thing| thing[:phrase] }

new_file = File.open("answers.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
