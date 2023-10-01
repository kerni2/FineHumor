# frozen_string_literal: true

class JokesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :joke_find!, only: %i[edit update show destroy]

  def index
    @jokes = Joke.order(created_at: :desc).page params[:page]
  end

  def show; end

  def new
    @joke = Joke.new
  end

  def edit; end

  def create
    @joke = Joke.new joke_params
    if @joke.save
      redirect_to jokes_path
      flash[:success] = 'Joke created!'
    else
      render :new
    end
  end

  def update
    if @joke.update joke_params
      flash[:success] = 'Joke updated!'
      redirect_to jokes_path
    else
      render :edit
    end
  end

  def destroy
    @joke.destroy
    flash[:success] = 'Joke deleted!'
    redirect_to jokes_path
  end

  private

  def joke_find!
    @joke = Joke.find params[:id]
  end

  def joke_params
    params.require(:joke).permit(:title, :body)
  end
end
