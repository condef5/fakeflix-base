class Api::MoviesController < ApplicationController
  def index
    if params.key? "filter"
      render json: Movie.where(status: params[:filter]), status: :ok
    else
      render json: Movie.all, status: :ok
    end
  end

  def show
    render json: Movie.find(params[:id]), status: :ok
  end
  
  def playback
    movie = Movie.update(params[:id], playback: params[:progress])
    render json: movie, status: :ok
  end

  def rating
    movie = Movie.update(params[:id], rating: params[:rating])
    render json: movie, status: :ok
  end
end
