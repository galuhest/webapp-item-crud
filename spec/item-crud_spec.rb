require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe "Item Webapp" do
	it "should allow accessing the home page" do
		get '/'
		expect(last_response).to be_ok
	end

	it "returns user's name" do
		status, id = Item.create("item N")
		get "/item/#{id[0]}"
		response =  response_body
		# puts response
		expect(response["status"]).to eq "OK"
		expect(response["name"]).to eq "item N"
	end

	it "create new user" do
		post '/item',{"name":"item N"}
		response = response_body
		expect(response["status"]).to eq "OK"
	end

	it "change user's name" do
		status, id = Item.create("item N")
		post "/item/#{id[0]}",{"name":"item N new!"}
		response = response_body
		expect(response["status"]).to eq "OK"
	end

	it "deletes a user" do
		status, id = Item.create("item N")
		post "/item/#{id[0]}/delete"
		response = response_body
		expect(response["status"]).to eq "OK"
	end

  def response_body
    JSON.parse(last_response.body)
  end
end
