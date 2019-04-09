class Api::EpisodesController < ApplicationController
  def index
    render json: Episode.all, status: :ok
  end

  def show
    render json: Episode.find(params[:id]), status: :ok
  end

  def playback
    episode = Episode.update(params[:id], playback: params[:progress])
    render json: episode, status: :ok
  end
end
