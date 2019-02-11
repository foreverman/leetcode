def max_profit(prices)
  min_price = Float::INFINITY
  maxprofit = 0

  prices.each do |price|
    profit = price - min_price
    if profit > maxprofit
      maxprofit = profit
    end
    if price < min_price
      min_price = price
    end
  end
  
  maxprofit
end

puts max_profit([7, 1, 5, 3, 6, 4])
puts max_profit([7, 6, 4, 3, 1])
puts max_profit([2, 1])
puts max_profit([2, 1, 2, 1, 0, 1, 2])
