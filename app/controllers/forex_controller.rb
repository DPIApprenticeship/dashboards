class ForexController < ApplicationController
  def get_currencies
    currency_url = "https://api.exchangerate.host/symbols"
    currency_data = URI.open(currency_url).read
    parsed_currency_data = JSON.parse(currency_data)
    currency_keys = parsed_currency_data.fetch("symbols").keys

    return currency_keys
  end
  
  def index
    @currencies = get_currencies
    render({ :template => "forex_templates/index.html.erb"})
  end

  def first_currency
    @currencies = get_currencies
    @first_currency = params.fetch(:first_currency)
    
    render({ :template => "forex_templates/first_currency.html.erb"})
  end

  def exchange
    @first_currency = params.fetch(:first_currency)
    @second_currency = params.fetch(:second_currency)

    url = "https://api.exchangerate.host/convert?from=#{@first_currency}&to=#{@second_currency}"
    exchange_data = URI.open(url).read
    parsed_exchange_data = JSON.parse(exchange_data)

    @amount = parsed_exchange_data.fetch("info").fetch("rate")


    render({ :template => "forex_templates/exchange.html.erb"})
  end
end