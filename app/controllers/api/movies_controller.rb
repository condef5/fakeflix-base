class Api::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]
  
  def index
    if params.key? "filter"
      render json: Movie.where(status: params[:filter]), methods: :rented, status: :ok
    else
      render json: Movie.all, methods: :rented, status: :ok
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
  
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :ok
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie, status: :ok
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    render nothing: true, status: :no_content
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.permit(:title ,:description ,:rating ,:duration ,:price ,:status ,:progress)
  end
end
