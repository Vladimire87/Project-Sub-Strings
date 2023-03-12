# frozen_string_literal: true

require 'set'

dictionary = %w[below down go going horn how howdy it i low own part partner sit By now you should feel pretty good
                working with strings arrays and hashes. We’ll do a couple of classic “intro to programming” problems
                in the next few lessons to help solidify your knowledge and get warmed up to working on small projects.
                You’ll need to rely on some of your basic knowledge of conditionals and flow control from the prep work
                but you shouldn’t need to do anything you haven’t seen before.]

def substrings(input_string, dictionary)
  word_array = input_string.split(' ')
  result_hash = {}

  dictionary_set = Set.new(dictionary.map(&:downcase))

  word_array.each do |word|
    dictionary_set.each do |substring|
      if word.downcase.include?(substring)
        result_hash[substring] ||= 0
        result_hash[substring] += 1
      end
    end
  end

  result_hash
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
