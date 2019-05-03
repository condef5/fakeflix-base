class Api::ProfileController < ApplicationController
  def index
    render json: { user: @current_user }, status: :ok
  end
end
