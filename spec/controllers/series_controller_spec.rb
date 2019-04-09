require 'rails_helper'

describe Api::SeriesController do

  before do
    @serie = Serie.create(
      title: "Mr robot",
      description: "Un joven programador se conecta con la gente pirateando sus máquinas.",
      rating: 0,
      price: 30,
      status: "billboard"
    )
    @episode = @serie.episodes.create(
      title: "Hello friend",
      description: "Eliot Anderson hackea a un indio",
      duration: 49,
      playback: 300
    )
  end

  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    
    it 'render json with all series' do
      get :index
      series = JSON.parse(response.body)
      expect(series.size).to eq 1
    end

    it 'render json with all series by filter' do
      other_serie = Serie.create(
        title: "Avatar, el ultimo maestro aire",
        description: "Pelea entre las naciones del fuego, aire, agua y tierra",
        status: "preorder",
      )
      get :index, params: { filter: other_serie.status }
      series = JSON.parse(response.body)
      expect(series.size).to eq 1
      expect(series[0]["status"]).to eq other_serie.status
    end
  end

  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @serie }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct @serie' do
      get :show, params: { id: @serie }
      expected_serie = JSON.parse(response.body)
      expect(expected_serie["id"]).to eq(@serie.id)
    end
  
    it 'render the correct @serie with episodes' do
      get :show, params: { id: @serie }
      expected_serie = JSON.parse(response.body)
      expect(expected_serie["episodes"].size).to eq(1)
      expect(expected_serie["episodes"][0]["title"]).to eq("Hello friend")
    end
  end

  describe "PATCH update rating" do
    it "returns http status ok" do
      patch :rating, params: { 
        id: @serie,
        rating: 4
      }
      expect(response).to have_http_status(:ok)
    end

    it "returns the updated @serie" do
      patch :rating, params: { 
        id: @serie,
        rating: 4
      }
      expected_serie = JSON.parse(response.body)
      expect(expected_serie["rating"]).to eq(4)
    end
  end
end
