require 'pry-byebug'
#   #stock_picker method

#   Arguments: 1 (array of prices, one for each day)
#   Returns: a pair of days (array) representing the best day to buy and the best day to sell.
#   Note: Days start at 0.


#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12

def stock_picker (prices)
  # 2 element (index) array with final result
  best_days = Array.new()
  # prices.length number of element pairs of indices
  # ([0,4],[1,6]...) representing the best candidates for each element
  best_profits = Array.new()
  max_profit = 0

  prices.each_with_index do |buy_price, i|
    max = 0
    j = i
    best_profits[i] = [i,j]
    while j < prices.length do
      if prices[j] - buy_price > max
        max = prices[j] - buy_price
        best_profits[i] = [i, j]
      end
      j += 1
    end
    if max > max_profit
      max_profit = max
      best_days = best_profits[i]
    end
  end

  return best_days
end

p stock_picker([17,3,6,9,15,8,6,1,10])