class ForexController < ApplicationController
  
  def test
    forex_site = open("https://api.exchangerate.host/symbols").read
    parsed_forex_site = JSON.parse(forex_site)
    @symbols = parsed_forex_site.fetch("symbols").keys 

    render({:template => "/forex/currency_view.html.erb"})
  end

  def second_currency

    @first_currency = params.fetch("symbol")
    forex_site = open("https://api.exchangerate.host/symbols").read
    parsed_forex_site = JSON.parse(forex_site)
    @symbols = parsed_forex_site.fetch("symbols").keys 
    render({:template => "/forex/second_currency.html.erb"})
  end

  def currency_converter

    @first_currency = params.fetch("symbol_1")
    @second_currency = params.fetch("symbol_2")
    currency_converter_site = open("https://api.exchangerate.host/convert?from="+ @first_currency + "&to=" +@second_currency).read
    parsed_currency_converter_site = JSON.parse(currency_converter_site)
    @exchange_rate = parsed_currency_converter_site.fetch("info").fetch("rate")
    
    render({:template => "/forex/currency_converter.html.erb"})
  
  end

end
