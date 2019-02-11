def reverse(i)
  sign = i < 0 ? -1 : 1
  result, div = 0, i.abs
  
  while div != 0
    div, mod = div.divmod(10)
    result = result * 10 + mod
  end

  sign * result
end

puts reverse(1)
puts reverse(0)
puts reverse(123)
puts reverse(-123)

