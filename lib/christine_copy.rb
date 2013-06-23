# Code by Christine Coulter and Tom Brennan
require 'pry'
class FinancialInstitution
  attr_accessor :clients
  def initialize()
    @clients = []
  end
end


class Client
  attr_accessor :name, :balance, :portfolio
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolio = []
  end

#updates client's balance after depositing money
  def deposit_cash(deposit_amount)
    @balance += deposit_amount
  end

#updates client's balance after withdrawing money
### To Do: Don't let balance go negative
  def withdraw_cash(withdraw_amount)
    @balance -= withdraw_amount
  end

#updates client's balance after buying stock
### To Do: Check if you can afford to buy
  def buy_stock(stock, number_of_shares_to_buy)
    stock.shares += number_of_shares_to_buy
    total_value = number_of_shares_to_buy * stock.price
    @balance -= total_value
    unless @portfolio.include?(stock)
      @portfolio << stock
    end
  end

#updates client's balance after selling stock
### To Do: Add logic to check if you own that many shares
  def sell_stock(stock, number_of_shares_to_sell)
    stock.shares -= number_of_shares_to_sell
    total_value = number_of_shares_to_sell * stock.price
    @balance += total_value
  end

  def to_s
    return "#{@name} has a balance of #{@balance}."
  end
end


class Stock
  attr_accessor :stock_name, :ticker, :price, :sector, :shares
  def initialize(stock_name, ticker, price, sector, shares)
    # Just 1 @ makes these instance variables,
    # If we had 2 @@ they would be class variables
    @stock_name = stock_name
    @ticker = ticker
    @price = price
    @sector = sector
    @shares = shares
  end

# def get_price(ticker)
# YahooFinance::get_quotes(YahooFinance::StandardQuote,
#  'ticker')['ticker'].lastTrade
# end

  def to_s
    return "The ticker symbol for #{@stock_name} is :#{@ticker}, \nwhich is currently trading at #{@price}. This company is in the #{@sector} sector. #{@shares}"
  end
end



#####Hardcode examples#######
s1 = Stock.new("Cisco Systems", "CSCO", 2, "Technology", 100)
s2 = Stock.new("IBM", "IBM", 1, "Technology", 500)
s3 = Stock.new("Wendy's", "WEN", 1, "Food", 0)
client1 = Client.new("Alphonse Von der Strudel", 1000)
client1.portfolio << s1
client1.portfolio << s2


#portfolio is an array and items are instances of the stock class
#####Gives readout#####

puts "#{client1.name}'s balance = $#{client1.balance}"


client1.buy_stock(s1, 200)
client1.buy_stock(s3, 100)
#client1.sell_stock(s3, 100)
puts "----------------------------"

puts "#{client1.name}'s balance = $#{client1.balance}"

binding.pry



