class Api::RentalsController < ApplicationController
  def index
    render json: Rental.all, status: :ok
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
