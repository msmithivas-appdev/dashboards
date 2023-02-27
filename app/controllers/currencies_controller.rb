class CurrenciesController < ApplicationController

require "json"

def first_currency
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")
  
  @array_of_symbols = @symbols_hash.keys



  render({ :template => "currency_templates/step_one.html.erb"})

end

def second_currency

  @from_symbol = params.fetch("from_currency")

  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")
  
  @array_of_symbols = @symbols_hash.keys

  render({ :template => "currency_templates/step_two.html.erb"})
  
end

def convert

  @from_symbol = params.fetch("from_currency")
  @to_symbol = params.fetch("to_currency")

  @raw_data = open("https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}").read
 
  @parsed_data = JSON.parse(@raw_data)
  @convert_hash = @parsed_data.fetch("info")
  
  @convert_val = @convert_hash.fetch("rate")

  render({ :template => "currency_templates/step_three.html.erb"})
end


end
