require 'faker'

# seed movies
10.times do
  movie = Movie.create(
    description: Faker::Movies::VForVendetta.quote,
    duration: (rand(7200) / 3600.00).round(2),
    price: rand(100),
    rating: rand(5) + 1,
    status: rand(3),
    title: Faker::Movie.quote,
    playback: 0
  )
  serie = Serie.create(
    description: Faker::Movies::VForVendetta.quote,
    price: rand(100),
    rating: rand(5) + 1,
    status: rand(3),
    title: Faker::Movie.quote
  )

  5.times do
    Episode.create(
      description: Faker::Movies::VForVendetta.quote,
      duration: (rand(7200) / 3600.00).round(2),
      title: Faker::Movie.quote,
      serie_id: serie.id
    )
  end

  movie.rentals.create(
    paid_price: rand(400) + 1
  )

  serie.rentals.create(
    paid_price: rand(400) + 1
  )
end
