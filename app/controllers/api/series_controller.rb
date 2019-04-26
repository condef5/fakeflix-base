class Api::SeriesController < ApplicationController
  
  before_action :set_serie, only: [:show, :update, :destroy]

  def index
    authorize(Serie)
    if params.key? "filter"
      render json: Serie.where(status: params[:filter]), methods: :rented, status: :ok
    else
      render json: Serie.all, methods: :rented, status: :ok
    end
  end

  def show
    authorize(Serie)
    render json: Serie.find(params[:id]), methods: [:rented, :duration_episodes], include: {episodes: { only: [:id, :title] }}, status: :ok
  end

  def rating
    serie = Serie.update(params[:id], :rating => params[:rating])
    render json: serie, status: :ok
  end

  def create
    @serie = Serie.new(serie_params)
    authorize(@serie)
    if @serie.save
      render json: @serie, status: :ok
    else
      render json: @serie.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize(@serie)
    if @serie.update(serie_params)
      render json: @serie, status: :ok
    else
      render json: @serie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize(@serie)
    @serie.destroy
    render nothing: true, status: :no_content
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

  private
  def set_serie
    @serie = Serie.find(params[:id])
  end

  def serie_params
    params.permit(:title ,:description ,:rating , :price ,:status)
  end
end
