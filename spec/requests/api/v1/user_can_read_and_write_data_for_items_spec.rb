require 'rails_helper'

describe "Items API" do
  it "gets a response from API with proper information" do
    create_list(:item, 3)
    # When I send a GET request to `/api/v1/items`
    # I receive a 200 JSON response containing all items
    # And each item has an id, name, description, and image_url but not the created_at or updated_at

    get '/api/v1/items'

    items = JSON.parse(response.body)
    expect(response).to be_success
    expect(items.count).to eq(3)

    last_item = Item.last

    expect(last_item.name).to eq("Awesome Item")
    expect(last_item.description).to eq("This is an awesome Item")
    expect(last_item.image_url).to eq("http://brooklynmakers.com/wp-content/uploads/2013/01/snuggly-ugly-monster-kiki.jpg")
    # expect(last_item.created_at).to eq(nil)
    # expect(last_item.updated_at).to eq(nil)

    #NEED TO PLUG IN SERIALIZER
  end

  it "can GET individual items" do
    # When I send a GET request to `/api/v1/items/1`
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  end

  it "can DELETE an item" do
    # When I send a DELETE request to `/api/v1/items/1`
    # I receive a 204 JSON response if the record is successfully deleted
  end

  it "can POST an item" do
    item_params = {
      name: "Best Item Ever",
      description: "Now with less lead",
      image_url: "http://brooklynmakers.com/wp-content/uploads/2013/01/snuggly-ugly-monster-kiki.jpg"
    }

    post 'api/v1/items', item: item_params

    last_item = Item.last_item

    expect(response).to be_success
    expect(last_item.name).to eq(item_params[:name])
    expect(last_item.description).to eq(item_params[:description])
    expect(last_item.image_url).to eq(item_params[:image_url])
    # expect(last_item.created_at).to eq(nil)
    # expect(last_item.updated_at).to eq(nil)

    #NEED TO PLUG IN SERIALIZER

  end
end
