def substrings(word, array)
  result = {}
  words = word.downcase.split(/[^a-z]+/)
  array.each do |array_word|
    words.each do |words_word|
      if words_word.include? array_word
        if result[array_word] == nil
          result[array_word] = 1
        else
          result[array_word] += 1
        end
      end
    end
  end
  result.sort_by {|k,v| v}.reverse
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)