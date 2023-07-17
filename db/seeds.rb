require 'faker'
require 'csv'

csv_file_path = Rails.root.join('db', 'us NY zips few.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
  Location.create!(
    postcode: row['zip'],
    latitude: row['latitude'],
    longitude: row['longitude'],
    name: row['city'],
    country: Country.first
  )
end

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    location_id: Location.all.sample.id
  )
end

page_type=PageType.create!(name:"Sports Club")
page_type2=PageType.create!(name:"Business")
page_type3=PageType.create!(name:"Event")

20.times do
  Page.create!(
    name: Faker::Name.name,
    description: Faker::Quote.matz,
    contact: Faker::Lorem.sentence,
    location_id: Location.all.sample.id,
    user_id: User.all.sample.id,
    page_type_id: PageType.all.sample.id
  )
end

Location.all.each do |location|
  User.all.sample(10).each do |user|
    post = user.posts.create!(
      content: Faker::Quote.matz,
      location_id: location.id
    )

    min_times = 1
    max_times = 7
    random_times = rand(min_times..max_times)

    random_times.times do
      post.replies.create!(
        content: Faker::Quote.matz,
        author: User.all.sample
      )
    end
  end
end
