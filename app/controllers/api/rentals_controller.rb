class Api::RentalsController < ApplicationController
  
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    authorize(Rental)
    movies = Rental.rentables("Movie")
    series = Rental.rentables("Serie")
    render json: {"movies" => movies, "series" => series}, status: :ok
  end

  def movies
    movie = Movie.find(params[:id])
    rental = movie.rentals.create(
      paid_price: movie.price
    )
    render json: rental, status: :created
  end
  
  def series
    serie = Serie.find(params[:id])
    rental = serie.rentals.create(
      paid_price: serie.price
    )
    render json: rental, status: :created
  end

  def create
    @rental = Rental.new(rental_params)
    authorize(@rental)
    if @rental.save
      render json: @rental, status: :ok
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize(@rental)
    if @rental.update(rental_params)
      render json: @rental, status: :ok
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize(@rental)
    @rental.destroy
    render nothing: true, status: :no_content
  end

  private
  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.permit(:paid_price, :rentable_type, :rentable_id)
  end
end
