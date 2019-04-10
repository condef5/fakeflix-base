class Api::RentalsController < ApplicationController
  def index
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
end
