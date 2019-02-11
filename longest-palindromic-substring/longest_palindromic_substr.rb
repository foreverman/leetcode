def longest_palindromic_substr(str)
  longest_substr = ""

  
  (0..(str.length - 1)).each do |start_index|
    current_palindromic = str[start_index]
    i, j = start_index - 1, start_index + 1
    while j < str.length && str[j] == str[start_index]
      current_palindromic += str[j]
      j += 1
    end

    while (i >= 0 && j < str.length && str[i] == str[j])
      current_palindromic = str[i] + current_palindromic + str[j]
      i -= 1
      j += 1
    end
    if current_palindromic.length > longest_substr.length
      longest_substr = current_palindromic
    end
  end

  longest_substr
end

def longest_palindromic_substr(str)
  start_index, end_index = 0, 0

  (0..(str.length - 1)).each do |i|
    length1 = expand_around_center(str, i, i)
    length2 = expand_around_center(str, i, i + 1)
    max_length = [length1, length2].max

    if max_length > (end_index - start_index + 1)
      start_index = i - (max_length - 1) / 2
      end_index = i + max_length / 2
    end
  end

  str[start_index..end_index]
end

def expand_around_center(str, left_index, right_index)
  while (left_index >= 0 && right_index < str.length && str[left_index] == str[right_index])
    left_index -= 1
    right_index += 1
  end
  right_index - left_index - 1
end


puts longest_palindromic_substr("babad")
puts longest_palindromic_substr("aacdefcaa")
puts longest_palindromic_substr("babba")
puts longest_palindromic_substr("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
