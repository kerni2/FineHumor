class JokesController < ApplicationController
  before_action :joke_find, only: %i[edit update show destroy]

  def index
    @jokes = Joke.all
  end
  
  def new
    @joke = Joke.new
  end
  
  def create
    @joke = Joke.new joke_params
    if @joke.save
      redirect_to jokes_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @joke.update joke_params
      redirect_to jokes_path
    else
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    @joke.destroy
    redirect_to jokes_path
  end

  private

  def joke_find
    @joke = Joke.find_by id: params[:id]
  end

  def joke_params
    params.require(:joke).permit(:title, :body)
  end
end
