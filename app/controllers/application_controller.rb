class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    "hello world"
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  get "/recipes/new" do

    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params)

    redirect to("/recipes/#{@recipe.id}")
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])

    @recipe.update(name:params["name"])
    @recipe.update(ingredients:param["ingredients"])
    @recipe.update(cook_time:param["cook_time"])

    redirect to("recipes/#{@recipe.id}")
  end

  delete "/recipes/:id/delete" do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    erb :index
  end

end
