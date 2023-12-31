# frozen_string_literal: true

class JokesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :joke_find!, only: %i[edit update show destroy]
  before_action :fetch_tags, only: %i[new edit]

  def index
    @jokes = Joke.all_by_tags(params[:tag_ids])
    @jokes = @jokes.page params[:page]
  end

  def show; end

  def new
    @joke = current_user.jokes.new
  end

  def edit; end

  def create
    @joke = current_user.jokes.new(joke_params)
    if @joke.save
      redirect_to jokes_path
      flash[:success] = 'Joke created!'
    else
      render :new
    end
  end

  def update
    if @joke.update(joke_params) && @joke.user_id == current_user.id
      flash[:success] = 'Joke updated!'
      redirect_to jokes_path
    else
      render :edit
    end
  end

  def destroy
    if @joke.user_id == current_user.id
      @joke.destroy
      flash[:success] = 'Joke deleted!'
      redirect_to jokes_path
    else
      flash[:notice] = "You can't delete someone else's joke."
      render :show
    end
  end

  private

  def joke_find!
    @joke = Joke.find params[:id]
  end

  def joke_params
    params.require(:joke).permit(:title, :body, tag_ids: [])
  end

  def fetch_tags
    @tags = Tag.all
  end
end
