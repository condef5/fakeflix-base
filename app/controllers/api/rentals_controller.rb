class Api::RentalsController < ApplicationController
  def index
    render json: Rental.all, status: :ok
  end

  def show
    render json: Movie.find(params[:id]), status: :ok
  end

  def movies
    movie = Movie.find(params[:id])
    movie.rentals.create(
      paid_price: movie.price
    )
    render json: { message: "Create successfull movie rental" }, status: :created
  end
  
  def series
    serie = Serie.find(params[:id])
    serie.rentals.create(
      paid_price: serie.price
    )
    render json: { message: "Create successfull serie rental" }, status: :created
  end
end
