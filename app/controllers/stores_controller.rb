class StoresController < ApplicationController

  def index
    zip = params[:zip]
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,name,city,phone,distance&pageSize=20&apiKey=#{ENV["Best_Buy_Key"]}"

    json_stores = JSON.parse(response.body, symbolize_names: true)[:stores]

    @stores = json_stores.map do |store|
      StoresService.new(store)
    end
    # binding.pry
  end

end
