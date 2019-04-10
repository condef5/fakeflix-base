class Api::SeriesController < ApplicationController
  def index
    if params.key? "filter"
      render json: Serie.where(status: params[:filter]), methods: :rented, status: :ok
    else
      render json: Serie.all, methods: :rented, status: :ok
    end
  end

  def show
    render json: Serie.find(params[:id]), methods: [:rented, :duration_episodes], include: {episodes: { only: [:id, :title] }}, status: :ok
  end

  def rating
    serie = Serie.update(params[:id], :rating => params[:rating])
    render json: serie, status: :ok
  end
end
