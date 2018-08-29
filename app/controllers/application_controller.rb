class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


  get '/recipes/new' do
    erb :new
  end


  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  patch '/recipes/:id' do

    @recipe = Recipe.find(params[:id])
    @name = params[:name]
    @ingredients = params[:ingredients]
    @cook_time = params[:cook_time].split.first

    @recipe.update(name: @name, ingredients: @ingredients, cook_time: @cook_time)

    redirect to ("/recipes/#{@recipe.id}")
  end


  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to ("/recipes/#{@recipe.id}")
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end






end
