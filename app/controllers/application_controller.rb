class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  post '/recipes' do
    r = Recipe.create(params)
    redirect "/recipes/#{r.id}"
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy
    redirect "/recipes"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    Recipe.find(params[:id]).update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{params[:id]}"
  end


end
