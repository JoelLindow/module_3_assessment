class StoresController < ApplicationController

  def index
    @stores = StoresService.new(params[:zip])
    
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name,city,phone&pageSize=10&apiKey=#{ENV["Best_Buy_Key"]}"

    raw_stores = JSON.parse(response.body)


    # binding.pry
  end

end
