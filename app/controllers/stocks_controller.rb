class StocksController < ApplicationController
  def index
    render json: make_stocks(10)
  end

  def update
    render json: modify_stock
  end

  def create
    render json: modify_stock
  end

  def show
    render json: make_stock(params[:id])
  end

  def destroy
    render json: "stock #{params[:id]} deleted"
  end

  private

  def generate_rand_str(length)
    characters = ('A'..'Z').to_a + ('0'..'9').to_a
    Array.new(length) { characters.sample }.join
  end

  def make_stock(isin=nil)
    stock = {}
    stock[:isin] = isin.nil? ? generate_rand_str(6) : isin
    stock[:price] = rand(0.1..10000.0)
    stock[:name] = generate_rand_str(5 + rand(6))
    stock[:timestamp] = 3.minutes.ago
    return stock
  end

  def make_stocks(qty=nil)
    stocks = []
    qty = 10 if qty.nil? || qty == 0 || qty > 1000
    qty.times do |q|
      stocks.push(make_stock)
    end
    return stocks
  end

  def modify_stock
    isin = params[:id]
    stock = params[:stock]
    st = make_stock(isin)
    st[:isin] = stock[:isin] unless stock[:isin].blank?
    st[:price] = stock[:price] unless stock[:price].nil?
    st[:name] = stock[:name] unless stock[:name].blank?
    return st
  end

end
