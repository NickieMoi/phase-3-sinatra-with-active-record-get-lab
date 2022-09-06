class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    Bakery.all.to_json
  end

  get '/bakeries/:id' do
    Bakery.find(params[:id]).to_json(include: :baked_goods)
  end

  get '/baked_goods' do
    BakedGood.all.to_json


  end

  get '/baked_goods/by_price' do
    BakedGood.all.order("price DESC").to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end

end