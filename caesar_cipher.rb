def caesar_cipher(sentence, factor)
  arr = sentence.split("")
  result = ""
  arr.each do |char|
    result_char = char
    increment = 0
    while increment < factor && factor > 0 do
      if result_char == "z"
        result_char = "a"
      elsif result_char == "Z"
        result_char = "A"
      elsif result_char >= "a" && result_char < "z" || result_char >= "A" && result_char < "Z"
        result_char.next!
      end
      increment += 1
    end
    result += result_char
  end
  result
end

caesar_cipher("What a string!", 15)