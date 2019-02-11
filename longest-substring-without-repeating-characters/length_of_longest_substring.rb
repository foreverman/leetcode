def length_of_longest_substring(str)
  longest_length = 0
  chars = str.chars
  chars.each_with_index do |char, index|
    substring = {}
    substring[char] = 0
    ((index + 1)..(chars.length-1)).each do |index2|
      next_char = chars[index2]
      if substring.key?(next_char)
        break
      end
      substring[next_char] = 0
    end

    longest_length = [substring.length, longest_length].max
    if longest_length >= (chars.length - index)
      break
    end
  end
  longest_length
end

def length_of_longest_substring(str)
  longest_length = 0
  start_index = 0
  current_index = 0
  substr = {}

  str.each_char do |char|
    if substr.key?(char)
      longest_length = [longest_length, substr.length].max
      start_index = substr[char]  + 1
      substr = {}
      (start_index..current_index).each {|i| substr[str[i]] = i}
    else
      substr[char] = current_index
      if current_index == str.length - 1
        longest_length = [longest_length, substr.length].max
      end
    end

    current_index += 1
  end

  longest_length
end

def length_of_longest_substring(str)
  length_of_longest = 0
  i = j = 0
  substr = {}
  
  while i < str.length && j < str.length
    if !substr.key?(str[j])
      substr[str[j]] = j
      j += 1
      length_of_longest = [substr.length, length_of_longest].max
    else
      delete_from = i
      i = substr[str[j]] + 1
      (delete_from...i).each {|index| substr.delete(str[index])}
      # substr.delete(str[i])
      # i += 1
    end
  end

  length_of_longest
end

puts length_of_longest_substring("abcabcbb")
puts length_of_longest_substring("bbbbb")
puts length_of_longest_substring("pwwkew")
puts length_of_longest_substring("a")
puts length_of_longest_substring("")
