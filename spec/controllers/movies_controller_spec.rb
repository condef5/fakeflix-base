require 'rails_helper'

describe Api::MoviesController do
  before do
    Movie.delete_all
    @movie = Movie.create(
      title: "Piratas de silicon valley",
      description: "Piratea y difunde",
      rating: 0,
      price: 15,
      status: "billboard",
      playback: 30
    )
  end

  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    
    it 'render json with all movies' do
      get :index
      movies = JSON.parse(response.body)
      expect(movies.size).to eq 1
    end

    it 'render json with all movies by filter' do
      other_movie = Movie.create(
        title: "Piratas de silicon valley",
        description: "Piratea y difunde",
        status: "preorder",
      )
      get :index, params: { filter: other_movie.status }
      movies = JSON.parse(response.body)
      expect(movies.size).to eq 1
      expect(movies[0]["status"]).to eq other_movie.status
    end
  end

  describe 'GET show' do
    it 'returns http status ok' do
      get :show, params: { id: @movie }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct @movie' do
        get :show, params: { id: @movie }
        expected_movie = JSON.parse(response.body)
        expect(expected_movie["id"]).to eq(@movie.id)
    end
  end

  describe "PATCH update" do
    it "returns http status ok in playback" do
      put :playback, params: {
        id: @movie,
        progress: 80,
      }
      expect(response).to have_http_status(:ok)
    end
    
    it "returns the updated playback movie" do
      put :playback, params: {
        id: @movie,
        progress: 80,
      }
      expected_movie = JSON.parse(response.body)
      expect(expected_movie["playback"]).to eq(80)
    end
  
    it "returns http status ok in rating" do
      put :rating, params: {
        id: @movie,
        rating: 3,
      }
      expect(response).to have_http_status(:ok)
    end
    
    it "returns the updated rating movie" do
      put :rating, params: {
        id: @movie,
        rating: 3
      }
      expected_movie = JSON.parse(response.body)
      expect(expected_movie["rating"]).to eq(3)
    end
  end
end
