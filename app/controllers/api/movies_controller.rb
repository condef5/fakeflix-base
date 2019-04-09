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
    movie = Movie.find(params[:id])
    movie.playback = params[:progress]
    movie.save()
    render json: { message: "Update successfull playback movie" }, status: :ok
  end
end
