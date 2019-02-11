def max_profit(prices)
  total_profit = 0
  (1...prices.length).each do |index|
    profit = prices[index] - prices[index - 1]
    if profit > 0
      total_profit += profit
    end
  end

  total_profit
end

puts max_profit([2, 1, 2, 1, 0, 1, 2])
puts max_profit([7, 1, 5, 3, 6, 4])
puts max_profit([1, 2, 3, 4, 5])
puts max_profit([7, 6, 4, 3, 1])
