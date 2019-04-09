class Api::EpisodesController < ApplicationController
  def index
    render json: Episode.all, status: :ok
  end

  def show
    render json: Episode.find(params[:id]), status: :ok
  end
end
