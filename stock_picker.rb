def stock_picker(prices)
  lowest = prices[0]
  highest = prices[0]
  lowest_index = 0
  highest_index = 0
  difference = highest - lowest
  prices.each_with_index do |price, index|
    if price < lowest
      lowest = price
      highest = price
    end
    if price > highest
      highest = price
    end
    if highest - lowest > difference
      difference = highest - lowest
      lowest_index = prices.find_index(lowest)
      highest_index = index
    end
  end
  return [lowest_index, highest_index]
end

stock_picker([17,3,6,9,15,8,6,1,10])